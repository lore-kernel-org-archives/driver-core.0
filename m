Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC942317C;
	Sun,  4 Oct 2026 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109812; cv=none; b=bg+BNLuH9RsYjj6wqtTlXsjrKG0ZjJGEABB/ir2L11230ShgJwxkpW7NGXQLoJFFtI1M7zYFUnaiTDPyVQ3A/nFvmltDR5enDJ6qO4a407dGrFTbR4VZiIgC5n2dbyLxN3cgG4auot6V00zlLeBthgo/e4+38SOPuPxAFtYUKrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109812; c=relaxed/simple;
	bh=wJaNWkVld6Ks8AC26u+wJzWqIBrvt36+SuQFJrZuVzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLlx2UuHSuPS7S7kZ64CodjW8kTQD6lEOBi/ZMHDDFlhEE0aooH/KzqeepuaG9B93oEqSWO7AUxKAlDxtBxd7xzV++ZSwkjPnYEk1mrMjkUilRLgfFLiM53/syrteH18hVz0CGrRJHBrtPhTpijvxgDK6cmpaKyMQZBQ1SnXe+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zzxv8ih4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zzxv8ih4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD59C1F000FF;
	Sun,  4 Oct 2026 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791109810;
	bh=I2x892nKWbX8P8xN3nv9dt1weX4c1HjNkPJ2oEbT0ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zzxv8ih49AvX+SnbrJm3ZaygtWBEkeztBB5ijB3CngcGNuvEwqaPAJD2oKPCdk7Tr
	 tuP97N05/lhf53cvr4AIGlzcRA6FG67St1LIn8czDMnk8FMNsQyBQvACPS49xflCbN
	 CoYssiDSI5KhqwQKcuADy8AnS1UAK0tEGerGNxrtJ3f53DkEw/PXZ8c4fT66cFmaMj
	 riUjGZhxehxqPY3eNbgtNf0N1TOR18q0dBxGryg8RkoujnMn2YAfLIy1spKVx39Crb
	 AvDeqaRr+0EhFqQek9SPltcoefP5H2o/MM+gQ8Qm8DLqfDefqee75ASE4RW/qkXw3Z
	 v7Ji38FCPQwCw==
Received: from johan by theta with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xDJTj-000000005Zr-13gx;
	Sun, 04 Oct 2026 12:29:59 +0200
Date: Sun, 4 Oct 2026 12:29:59 +0200
From: Johan Hovold <johan@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] usb: core: don't set drvdata to NULL in
 usb_unbind_interface()
Message-ID: <asIqp3h0xMdX-rYm@hovoldconsulting.com>
References: <20261002145455.3392703-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002145455.3392703-1-dakr@kernel.org>

On Fri, Oct 02, 2026 at 04:52:49PM +0200, Danilo Krummrich wrote:
> usb_unbind_interface() serves as the remove() callback of struct
> usb_driver and calls usb_set_intfdata(intf, NULL) to clear the bus
> device private data pointer.
> 
> However, the driver core code already sets the bus device private data
> pointer to NULL in device_unbind_cleanup() *after* devres_release_all(),
> which makes the call redundant.
> 
> In addition, it can create unexpected NULL pointer dereference scenarios
> when drivers use managed APIs.
> 
> 	int probe(struct usb_interface *intf,
> 		  const struct usb_device_id *id)
> 	{
> 		struct data *data;
> 		int ret;
> 
> 		data = devm_kzalloc(&intf->dev, sizeof(*data), GFP_KERNEL);
> 		if (!data)
> 			return -ENOMEM;
> 
> 		ret = devm_device_add_group(&intf->dev, &foo_attr_group);
> 		if (ret)
> 			return ret;
> 
> 		...
> 	}
> 
> 	ssize_t foo_value_show(struct device *dev, struct device_attribute *attr,
> 			       char *buf)
> 	{
> 		struct usb_interface *intf = to_usb_interface(dev);
> 		struct data *data = usb_get_intfdata(intf);
> 
> 		/* Potential NULL pointer dereference */
> 		return sysfs_emit(buf, "%u\n", data->value);
> 	}
> 
> Nothing prevents usb_unbind_interface() to race with foo_value_show()
> and set usb_set_intfdata(intf, NULL).

Fortunately, we don't seem to have any USB drivers that use these devres
interfaces. (There is one recent USB HID driver, but it uses static
driver data (!) and clears the driver data pointer itself on unbind...).

> Besides that, the Rust driver core code manages a driver's bus device
> private data and destroys it in device_unbind_cleanup().
> 
> If usb_unbind_interface() sets the pointer to NULL prematurely, the Rust
> driver core code sees NULL, and hence skips the destructor of the bus
> device private data, which leaks all its resources.
> 
> Thus, drop usb_set_intfdata(intf, NULL) from usb_unbind_interface() and
> move it to usb_driver_release_interface(), which manually calls the
> remove() callback of struct usb_driver, and hence can't rely on the
> driver core.

I believe you need to drop the usb_set_intfdata() in the
usb_probe_interface() error path as well.

> Cc: stable@kernel.org
> Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

With the above fixed you can add my:

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
