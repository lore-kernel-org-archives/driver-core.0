Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03232472AE
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 23:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783638406; cv=none; b=VUzb9cCVdmplYdabjipjwsxxCWADacBqjUnUvckiZ9ToxCx/GK7Z5oqoAs9LzY2yjkjthTkWIfYQ+XoIDkWEMxnzmX9faDwnOnofwtlF97FzG/FUlxdsFx3eYNA26Xprkty7tKaRwlcmw5qf6vRzFIkiQ6pCkGYsX3p6asNTN8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783638406; c=relaxed/simple;
	bh=Nr20FWjG2NroNbXZwhjr1SjTV8yECc1KxfDUU9MIAqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haTm3ReCSIU9uNPBRyxVO5MyyNtktGgfL49akK3D6NMYT5ElvYxyx6p8xxs8gzQR0QzBDz+cjb66+GjNN8Zm2tdiSMUc6/aGVpV5o89BQRZiabl89kTYLFlM8RDWgp0H1rWsQpDY73ATbiM/wyjjtbgnSj/U3lE0GDBH+ccpGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=g9tqR9pp; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="g9tqR9pp"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e57a753f9so22163885a.2
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 16:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783638404; x=1784243204; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+I1Kh+neFzTKmOmQym2AfGZpWjdwKJKu5WX9LjuS6A=;
        b=g9tqR9ppPkE5Zg69pT9KVIkJbf0smTKGkx6VTPeUo2TI3jQT29e61YcWqt28UCvvKV
         xViSj6HqaAUHrfwJXW903I3+VUOcGfiCngPx5SCeSjLbdaS6owPZ4vo3ZECvB8K4pMEY
         QoUwkWX8y4nttqjLLpuyjLYc5I6L2pqJ7S1yewD7/hOmom328VYDZu77Ksvw5DhZ0nZA
         w3aWMMzvqFyK/1eFnrI5z+8BZYaKDfO1tJ8GE1r9C+GHIgD+4dYKFDsU0t7qDWulD6ca
         7yKvpxbnnvGj+yRXUvqjZE6i9czYeA3fTgu1qVjO/1mT4AOTpK3Fwk3keXcuH2sujx3i
         VGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783638404; x=1784243204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+I1Kh+neFzTKmOmQym2AfGZpWjdwKJKu5WX9LjuS6A=;
        b=QYPWqYg/jnffm2mHqdBx8p0PgIr/VS+gTrMG/3Aa9EhkkPGENB7JxTszqFoPerw1kJ
         zLakLZq55a1zLQlyW0cWZTmE5y9EVQw1ZOogQEAI80xW7wraYx3dtJP+kdMRJjKY4GKS
         zBJIwHa4MqdnxoeMveycTCKcimxN8gFJMgpEhXRTU5NrC3PDZiQkwlypcB9/hatvL9Sk
         yKtAzRUxRQqmBZ0yKkIgWYn3WJKrLLNBOeR1Vh5x1n+RH71xfNmFua6k6TGH/dzdrUE2
         3DjEtF0uj1Ixe18geg8eYmj7wp0DDLY/AjH8PNi0QbZbM9W4xMZ57+2Hid7n0B90B2ER
         158Q==
X-Forwarded-Encrypted: i=1; AHgh+RrYOANOir2ABR5obkbKvKyjDdQP+fGgj9e0dtq/ZqLYKtY8G+5XZs0eXfd2wB1eyIVKN5sRsihMxkH2Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNAOoRdhrBIexoMuHCzbUykn721QgXpzsxQCYeZlm/3m2X2UIB
	h58+03voDK9oEn4Oogg/i8f2+dRMXh40hTS9Ah4pf+toq6Znyemc6QRdoC9ItaIq7Gw=
X-Gm-Gg: AfdE7cmfYPNubBEGYNDGqs1900Aj8PJUNp08oWuUVZsoucB1kMqft4kZDPwaesWbvMx
	kXNIbjtug5x35o4KHWDAE+EZamIA/gSn1isiuozauOXTbKnrudbvHLI2uKCXsujxnzSvVFKegId
	VWiSoJ7gBncXE/PqINCTENu9lxZNpTqNlLcIjWMDAO49oBbxbeaYO4rzI0AxSES5f9FXC3ocH+t
	VZMIqZbge8I9uWg4ibcDWoWmKmp6bfvusm/rJ4myG4zBFMlCWMS8FbN6+VCB1wTuRIdUx64j8n+
	w/GH4JSMxmafV63pu0991sboAI0wTvb7onPwsrTcRIe6YrwIvFuzbMEHnf7eDFZjbrHOicUp/Io
	IjBQm2rHlZyRBROJ3KtuKgY7owZ4n8ikI3PjJ8N3LAsH0dRjscKdYOyxnHjLHlY+dHNEhD8ckL5
	cGwlyvTz+DgJV2ocWlpP7DONnwLG4Y1j9sjyG9v9p7Yp5FXK5DnrbsNxIlqNzg4VotUNwO
X-Received: by 2002:a05:620a:31aa:b0:92e:7db8:1e86 with SMTP id af79cd13be357-92ecf6aa487mr1099339185a.58.1783638403562;
        Thu, 09 Jul 2026 16:06:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4b1bbsm59189185a.2.2026.07.09.16.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 16:06:42 -0700 (PDT)
Date: Thu, 9 Jul 2026 19:06:38 -0400
From: Gregory Price <gourry@gourry.net>
To: "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 09/10] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <alApfp2z9Thyan16@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-10-gourry@gourry.net>
 <6a502267b17cc_3b7ee51008f@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a502267b17cc_3b7ee51008f@djbw-dev.notmuch>

On Thu, Jul 09, 2026 at 03:36:23PM -0700, Dan Williams (nvidia) wrote:
> Gregory Price wrote:
> > +	ranges = kmalloc_array(dev_dax->nr_range, sizeof(*ranges), GFP_KERNEL);
> 
> The new hotness is:
> 
> ranges = kmalloc_objs(*ranges, dev_dax->nr_range);
> 

ack.

> > +static ssize_t state_show(struct device *dev,
> > +			    struct device_attribute *attr, char *buf)
> > +{
> > +	struct dax_kmem_data *data = dev_get_drvdata(dev);
> > +	const char *state_str;
> > +
> > +	if (!data)
> > +		return -ENXIO;
> 
> Cannot happen with a dev_group attribute. If probe succeeds then drvdata
> is present. If probe fails, attribute never appears.
> 
> When unplugging, dev_groups are unregistered before drvdata is cleared.
> 

Ah good to know.  I am always paranoid, but i'll drop.

> > +
> > +	if (data->state == DAX_KMEM_UNPLUGGED)
> > +		state_str = "unplugged";
> > +	else
> > +		state_str = mhp_online_type_to_str(data->state);
> > +
> > +	return sysfs_emit(buf, "%s\n", state_str ?: "unknown");
> 
> So the "unknown" case does not need to be here.
>

mhp_online_type_to_str can technically return NULL, seems better to not
just let a NULL dereference sit latent even if we can visually tell it
can't happen today?

> > +	/* Always create blocks for backward compatibility, even if offline */
> 
> Unless maybe a driver knows better and wants to preclude the possibility
> of legacy per-block hotplug policy firing? I.e. driver asks for dax_kmem
> to start in the unplugged mode per my "should DAX_KMEM_UNPLUGGED be a
> online_type with a different sentinel".
> 

I suppose I can put DAX_KMEM_UNPLUGGED in the header and allow this.
That seems reasonable, and makes sense why to differentiate
DEFAULT/UNPLUGGED.

ack.

> > +	rc = device_create_file(dev, &dev_attr_state);
> > +	if (rc)
> > +		dev_warn(dev, "failed to create state sysfs entry\n");
> 
> Always prefer statically declared attributes. In this case an attribute
> that only appears while the driver is attached would be something like:
> 

ack.

> > -	success = dax_kmem_do_hotremove(dev_dax, data);
> > -	if (success < dev_dax->nr_range) {
> > -		dev_err(dev, "Hotplug regions stuck online until reboot\n");
> > +	if (dax_kmem_state_is_online(data->state)) {
> > +		dev_warn(dev, "Hotplug regions stuck online until reboot\n");
> 
> I like that the BUG() is avoided, but I think these should stay
> dev_err() given the severity.
> 

I had to go back to calling remove_memory() by default given different
feedback, but I think if anything I will just modify the BUG() to a
WARN() and call it a day.

ack on dev_err().

> > +	struct device *dev = &dev_dax->dev;
> > +
> > +	device_remove_file(dev, &dev_attr_state);
> > +
> 
> One less cleanup to do if the attribute is registered statically.
> Attributes are shutdown prior to this point.
> 

ack.

~Gregory
