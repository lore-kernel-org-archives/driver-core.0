Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6778737F739
	for <driver-core@lists.linux.dev>; Tue,  6 Oct 2026 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791319545; cv=none; b=p7iJ5uVq93M15uFUiB3eFEkrhtGFg6xKyZXdbuRTRayKzzqVACGABpynxk3H2aqvJzJaChzZXErNOk+iHpHpjgM1U0ueRFSS2nhlKq5pMivXKzzLc5CTYpI/54xbK2lYv2rOgUGT70bzlVhulAyJjK8kmW3m8kjzNAMSGWjXqaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791319545; c=relaxed/simple;
	bh=/3t7EwWiM7LlTPc2Wvwag4ghLE4sethZxT0s8a++x80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rICmLAVAJhAKPgtxk9mKLWTCdf9fIyaNbB9+55u2iib8LBtZ+j9r3Q1/CmIEJ1sEKr98jVWz7B4+FAMswGeaNUe4uyI4M2JZb/9Xu65B4IOLJ7DbVDCwoXwEo8Bl8aG5X0yfsmONygoKOHyXux7uFjqy+a5zW4fH/tX11MI2mTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=K1FA2T0x; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="K1FA2T0x"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533973605a2so12489921cf.2
        for <driver-core@lists.linux.dev>; Tue, 06 Oct 2026 13:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791319542; x=1791924342; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5oV60tu11G0uGFi+HRm6VWRFiiotgHws8p5eyNsqFk=;
        b=K1FA2T0xfuzlKAfbG9CmlvKbkP9JOaZ4Wh2hISLYbeXFeuMcV7Z5OpXY8A7BN3fwUO
         +9XhoQiCODFtFtNFGBRIBmNONmKZ387T+EjaTeUsflARIzVfWlbmylT896H/d62vUeJO
         YD8hJlFfe/Ee5f6p6YZjTXOUt91pYps/J54dsVg55sdV5uvxNNrClDPfzcTjDfMfG+8U
         rDoXlIYLH7cPyBxjKJoGE5CEGj0Qm2929sWjLDSCBjto/79GFqag2TWNsxzRF65vC44p
         mqdKQO+9r3dB/Gnq2Pj/g45dR3QZImzQUQajJP+HMWdz9uhdq1uepeI+neYdl231EEOs
         3+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319542; x=1791924342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5oV60tu11G0uGFi+HRm6VWRFiiotgHws8p5eyNsqFk=;
        b=nOe129mg94E1k0pMrFcdv1zUfJW25NOukmj1RZ5SMfa45xx5O09xHSk4TUBTd5bPxs
         BVgeeZCRyU/XsjOGI2iJzk8f9NzfcaaXIZKcpXnI470ooWChS1uPOAKKWe4Oj7eq4xqF
         Az/4LH+8PVw4EG42JIR7OIBmGcVBOPO0Nnfyp+QwnaxNe3TPAbmNhRvNtB96L0pLhYN+
         REajKinfL+m7/d9tvmi14x/u4MZKizTpsS9Wfk5N4NGDykOZk2DymSxOt4QvVMimaA3D
         IV26tn+e65bxr/hmgQCFuhvgRx0YANwJmC6umAjId4Fs7qs0gJBeChkcHmEy9JuEe8Ic
         6I3A==
X-Forwarded-Encrypted: i=1; AKwUvBz7i1z4WOYLaYoqy78L9h6c+HgL/sc97wFsD3YDTXJmuyKqYHqHoFUCImxxviOQv2k3P8pTWpfcyZOvtw==@lists.linux.dev
X-Gm-Message-State: AFuF++ny4Fdp/ncqQVdLRzBqi4kqKDMyhQg9TA8AqJOsKEnKbvayuuCt
	DCjdU67eLkm/UqK6zyyvN7rrYEQgkm3+KCBKGKTwujU6rN1aM/tMZCtU8a0W/06EqQ==
X-Gm-Gg: AYBFou3KvKJNPmp79gsP1IwBA+alosPxe71WetaoB5x/Zmg8Tx6oZC4DODUpuERpQLT
	EfLnEoaAMUPZt4FONGSQYjOFrw7a7DjAlVuJdGQMeE/AKz+zyUkQVszHo0mN8rzyHzCUZFvRdAH
	2OWZ8+f6Z152fUDaA3c3u4vEc8m6rCICYr3d2yWEWz5ChpmlLDBmkiOg7Tf/d2gLXf0hrq4uxqT
	wk+f/Q3WkWG9/wrm+yNZ9mXokzFtobHnCpveFM2E7dYCf0Gs4YkLndgdhLQuzeELFvsOwxRdQ1d
	cWE+dj7/dKBhqfJfa3VMB0ZEapU4cc579qV2p4eKxqOsBIWeT2MzEt24toCsTkUuH9Uh8tWhyG4
	MktulsvtDqVV9T7/dm3A1Az3/YyW3X8MvUH0EBeJTNDQ13Fm8l0Y+iF44PQErSISQHgIk+e6zpO
	uQapK79su4vDZUpjv4csulqmX+ymJybbBtjDB1t5B8fW1V4kFBFrntRg+TvslA38+X4D7X3RY=
X-Received: by 2002:ac8:570d:0:b0:535:2e3b:6885 with SMTP id d75a77b69052e-5357560d7eamr30491cf.48.1791319541733;
        Tue, 06 Oct 2026 13:45:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535721ec7b1sm4448851cf.30.2026.10.06.13.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:45:41 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:45:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: PETER Mario <mario.peter@leica-geosystems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] driver core: Take parent lock in async device attach
Message-ID: <db55e2bb-c2ec-4bcf-8cf6-39420449dd92@rowland.harvard.edu>
References: <20261006132335.4014316-1-mario.peter@leica-geosystems.com>
 <2026100658-stoic-unread-22c6@gregkh>
 <eb845da3-5799-4b0b-87d8-266ff57e84f3@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb845da3-5799-4b0b-87d8-266ff57e84f3@leica-geosystems.com>

On Tue, Oct 06, 2026 at 03:29:48PM +0000, PETER Mario wrote:
> Hi Greg,
> 
> On 10/6/26 16:38, Greg Kroah-Hartman wrote:
> 
> > On Tue, Oct 06, 2026 at 01:23:35PM +0000, Mario Peter wrote:
> >> On buses with need_parent_lock set (only USB), probe() must run with the
> >> parent device locked. A synchronous attach after device_add() gets this
> >> from the caller, e.g. usb_set_configuration() holds the udev lock while
> >> adding interfaces. __device_attach_async_helper() runs the probe from an
> >> async worker instead, where that lock isn't held, and only takes
> >> device_lock(dev).
> >>
> >> With async probing enabled for USB drivers (driver_async_probe=*,
> >> module.async_probe=1), hub_probe() of a multi-TT hub then races with
> >> usb_set_configuration() and both create the interface's endpoint
> >> devices. On an i.MX8MM board this hit 11 of 100 boots:
> >>
> >>   sysfs: cannot create duplicate filename '.../1-1/1-1:1.0/ep_81'
> >>   Call trace:
> >>    sysfs_warn_dup
> >>    usb_create_ep_devs
> >>    create_intf_ep_devs
> >>    usb_set_interface
> >>    hub_probe
> >>    usb_probe_interface
> >>    really_probe
> >>    __device_attach_async_helper
> >>    async_run_entry_fn
> >>
> >> Take the parent lock there as well, like __driver_attach_async_helper()
> >> does, and move __device_driver_lock/unlock() up for that. With this the
> >> warning was gone in 300 boots.
> >>
> >> Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
> >> Assisted-by: LLM
> >> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> >> ---
> >> Seen and tested on 6.16.y, which has the same code here. On mainline
> >> only build-tested.
> > 
> > Please verify this on the latest tree, 6.16.y is _VERY_ old and
> > obsolete, lots has changed in the year it was released.
> 
> Moving this board to the latest kernel for a test isn't that easy, as
> its board support isn't upstream.

It should be fairly simple to run the verification on a standard PC 
using an up-to-date kernel.  Nothing in the bug description or fix is 
specific to i.MX8MM.

> But the affected code is still the
> same in v7.3-rc6. In dd.c, __device_attach_async_helper(),
> __device_attach() and __driver_attach_async_helper() are unchanged
> since v6.16. On the USB side, usb_set_interface() and
> create_intf_ep_devs() are unchanged, and usb_set_configuration() and
> hub_configure() only got the kmalloc_obj() conversions.
> 
> >> Not covered: deferred_probe_work_func() also re-probes via
> >> __device_attach() without the parent lock.
> >>
> >> Analysis and patch done with the help of Claude Code.
> > 
> > This feels really wrong, what bus is the host controller on for these?
> 
> The platform bus, it's the ChipIdea controller of the i.MX8MM:
>    /sys/devices/platform/soc@0/32c00000.bus/32e50000.usb/ci_hdrc.1/usb1/1-1/1-1:1.0
> 
> 1-1 is an onboard USB2514 hub (multi-TT). The host controller isn't

Does the fact that the onboard hub is multi-TT have any connection with 
the bug?  Not as far as I can see -- but I had to waste a minute 
thinking about it.  If you agree, please remove that irrelevant detail 
from the patch description.

> part of the race, both sides are in the USB core, for that one hub:
>   
> - usb_generic_driver_probe() of 1-1 calls usb_set_configuration(),
>   which holds the 1-1 lock, does device_add() for 1-1:1.0 and then
>   create_intf_ep_devs() for it.
>      
> - device_add() only queues the probe of 1-1:1.0. The async worker runs
>   hub_probe() -> usb_set_interface(hdev, 0, 1) -> create_intf_ep_devs()
>   with only the 1-1:1.0 lock held.
>      
> create_intf_ep_devs() checks and sets intf->ep_devs_created without a
> lock of its own, so both create ep_81. With a synchronous probe,
> hub_probe() runs inside device_add() with the 1-1 lock held, and this
> can't happen.

You should describe this race in more detail (like you just did here) in 
the patch description.  It will help explain exactly what it is you are 
fixing.

> The USB core relies on that lock. need_parent_lock is documented as
> "When probing or removing a device on this bus, the device core should
> lock the device's parent", and usb_driver_claim_interface() says
> "Callers must own the device lock, so driver probe() entries don't need
> extra locking". __driver_attach_async_helper() takes the parent lock,
> __device_attach_async_helper() doesn't.

FWIW, I agree that this is a real bug and your solution is the right 
approach for fixing it.

Alan Stern
