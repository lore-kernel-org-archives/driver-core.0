Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192E31AAAA;
	Mon,  9 Mar 2026 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071738; cv=none; b=ZuSy3xDsTX4Tpe9f3M6Oufjp/Zv6SYau2lBzGq+a5QVm6kbRP8s2e0uKqMQQN93r6HqUIFLwikyNrlWhWPDoQ8KfW/coSTvcjecQ153EueOHwxj/n48pUHpOx6k6acyVczrdqhHDAKwm6V7hjVP/CHgRHZGuiYAfy/U/qCVFQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071738; c=relaxed/simple;
	bh=qXIJ+MnaMru8TxrmXBo3FzWMx/CodwsE3gYGQJwSBLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHkiNCFeaa9fj2vVWatl1FsNHVAbfNT1XKeUNEXX0CVrn3zaWBYWIqaIj1Xn0G4NdZ4o+77ApI8cybAYGLtVSYsi/WvHijwOTyWVh8a7rS8eKVX1Mk6sv3VqkUa9jTMgSJypPoAKrXYKGErgDr2imOtbgKc5YxLFKM7HeeDMIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j8IyccC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j8IyccC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AAEC4CEF7;
	Mon,  9 Mar 2026 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773071738;
	bh=qXIJ+MnaMru8TxrmXBo3FzWMx/CodwsE3gYGQJwSBLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8IyccC3leEcgtuq4KmLVPBMUW0iVnX6sLM2xG0Z0vDpGy8ek1c2UJzR4INNPsjXv
	 En4HtDUlFLmcLOXMhP8aHCcFJgoHm79tl4MD/QNq5PMXPtDUNpibzFnoebwFcjEjVr
	 NiTdSPPsnvzq70W2Fzidl9TXF7m31PZEiD/Z2riM=
Date: Mon, 9 Mar 2026 16:55:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node
 for a faux device
Message-ID: <2026030921-dwindling-tarnish-6141@gregkh>
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh>
 <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh>
 <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>

On Mon, Mar 09, 2026 at 09:16:19PM +0530, Shivendra Pratap wrote:
> 
> 
> On 06-03-2026 19:54, Bartosz Golaszewski wrote:
> > On Fri, Mar 6, 2026 at 3:13 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > 
> > > On Fri, Mar 06, 2026 at 03:07:03PM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Mar 6, 2026 at 2:54 PM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > > 
> > > > > On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski wrote:
> > > > > > Add a new variant of faux_device_create() taking a firmware node handle
> > > > > > as argument and attaching it to the created faux device. This allows
> > > > > > users to define and read device properties using the standard property
> > > > > > accessors.
> > > > > 
> > > > > Why would a faux device have firmware backing?  Doesn't that mean it
> > > > > should be a platform device?
> > > > > 
> > > > > > While at it: order includes in faux.c alphabetically for easier
> > > > > > maintenance.
> > > > > 
> > > > > Hint, that should be a separate patch, and is never something that I
> > > > > enforce or require in .c files I maintain :)
> > > > > 
> > > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > > > > ---
> > > > > > Hi Shivendra et al!
> > > > > > 
> > > > > > This patch is related to my response to your reboot-mode patch[1].
> > > > > > 
> > > > > > You should be able to use the new function like:
> > > > > > 
> > > > > >    faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwnode_handle(np));
> > > > > 
> > > > > What is the fwnode handle here for?  Why is it required at all?  What
> > > > > resources are involved that would want this?
> > > > > 
> > > > 
> > > > Shivendra creates a faux device that registers with the reboot-mode
> > > > subsystem which reads the reboot-mode definitions from devicetree. The
> > > > faux device needs to have the "reboot-mode" OF-node attached. In his
> > > > current proposal, Shivenda had to bypass faux device's probe() because
> > > > he can't have the fwnode attached before probe() is called.
> > > 
> > > Why would a firmware device be attached to a faux device?  A firmware
> > > device is, implicitly, already part of the firmware "device tree", so
> > > there should be something for it to be a child of already in the system.
> > > 
> > 
> > Shivendra: I rememeber there was an issue with using any proper
> > devices like platform or auxiliary with this but - as the series is
> > already at v20 - I can't find the actual discussion. Could you please
> > describe what the issue with driver matching was?
> 
> reboot-mode node is a property of psci which defines the reboot commands.‌ As
> its not an actual device we wanted to avoid creating platform or aux device.
> few references here:
> 
> https://lore.kernel.org/all/rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoofpdio6cwe@innio7qvotye/
> 
> Till v17, we were exposing an explicit of_node based registration in reboot
> mode and then registering it from psci driver.
> Post this, Lorenzo suggested to move this outside of psci and use a faux
> device instead.

As this is a "real" device that talks to hardware (i.e. you have a
firmware device representation), please do not use a faux device, that
is not what that interface is for.  Instead, as it is a firmware device,
just use a platform one as you already have a representation of it
somewhere in the system, right?

thanks,

greg k-h
