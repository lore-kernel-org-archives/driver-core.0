Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F50369206
	for <driver-core@lists.linux.dev>; Sat, 10 Oct 2026 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596995; cv=none; b=RBZHrqNxWqpK59rXyNNBBpaOTlrzDTLmtDTqIv5bTbgLFlAgzoxIikzeAT8apkWOmqoq9jk+vQHuOFDPy9+NGafcko+BhTvqoV4CiymNExIPgUUpAMFwN94MU6WDy6lQUYoLz3u+ZeU8oDXkex9/4Mqk7NrkHKFuTcEZf59nURY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596995; c=relaxed/simple;
	bh=W8wqps2u7akJN+4Ig9t6psXDckfkXSUUQ2f8o0U8UZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDpFTrDz2vcUazF1V60zi0T5SMsTMfH9krcH7A88mCenlH6jfSo/R9GfoHWhzKff+FSPJs8BQk2CaY60moLnw9whJwBPrTC/83gfQ4D3bh95DIsueHffS76gfb/UH1SqO9FiU9WXmMK564v+OAoKfG76dK7COrWqT+XN3tAWUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=v3V4QfBM; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="v3V4QfBM"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5338f65913dso3133971cf.2
        for <driver-core@lists.linux.dev>; Fri, 09 Oct 2026 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791596993; x=1792201793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HX/UZz27MsL/V4wPwo8QU7r3MDtmRSA6wmc9p+u+eaw=;
        b=v3V4QfBMnUeEvs+vM0mOcy7aplSft6vuXopwEL1YhRhkD7azrzYfotM/XkCDQiV0Fw
         A24gtOugTJ3Hak3e+5thMtgREBZmaBeMAp4HakIDxWAIYUGBnvp70OiE0yOAu/pEwlFI
         uJZ0CJISkSGtY9NqepTU7dHgi/nOajGBk/XH8Bwe703OVVW4WOHCVjECjnYEAD8K3W6F
         Z7A7aOI7IXOjaFwUFHrUHXkl/6v6tJ9Q+1cMlnSyve4G5Ed6VZtEy/NkSebNfc3bv4VH
         GDuxvMA33Qas2I0LjwdhOfXsUfZEPdQ8UiWR/DafACn56ILY6SHWXl4mn52L162zYReW
         INZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596993; x=1792201793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HX/UZz27MsL/V4wPwo8QU7r3MDtmRSA6wmc9p+u+eaw=;
        b=W4baNTkDRnVG5Me+KaYK36RG887sLUvnTJtmoqKvltATaSCTy3KNycAKZvfvvLjc7V
         F1xy2voD9cToN6WLTOVTulhVq+BAcEHetPpio+rR/hzjsVzlUOOnxFF0598Kddls0leU
         Djaiu2OBxJxaRJxSCrABx4v23+1Vn6LuxIx9vx4RsQGyGnya/JvutFfdRnoejJZpFxY0
         vsIFsj5h1b388cgrmBYPeFiy1aIwMqpozIrUXq54DUyAmHPCPKgTChR1sC2pKKG4EzZt
         xLk6LfLo8unBBRFoAiQItP/N0A5y02yO/Blsf/EP5BagrYPNh4QKsXMZ6eez91AlECr0
         tXFg==
X-Forwarded-Encrypted: i=1; AKwUvBxtlzcI65+UG2DD9GQ4ZtuZ4qRwBg6P3nbaHoY0cn48cQRhVxe3zDyVD4uv1tjaAs2V7V6CnE8zGbfB2g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIxFN189l/YIC22bTqReIjEm2aMjicFH2X38g+OuuJ9qyTCeinD
	XckVT6SAxiUJTHA3BOoOBvel76zKxDFAporio1oYwUZvOzHbCkMCALQUYAZkNrfw/A==
X-Gm-Gg: AYBFou376Ek/SFY6hvvbZMb3ictuSnhw3qeNUsQDBASgkIaGPZTT6xzrDZsNglemmMA
	UgEkzI5FW765LL4iq7aNfzk+1zfWMGDCjPi+R92kOCY26LbyHWEsZinaywHDIHNxPa/PAsUUjXK
	E2Rnrozm7IReidNMo34SVfdlQHR2r4F6wk1Xshwq8hA49pKOjbmtCabDJy0Fe6ZTjoC64YHL9PI
	x+RYFviPKynRz3YiM44enTiJGHxXB5u9asUJbKXwEwnhYbK7rJT+OuN94DymVsFi3uFdqe5dcQf
	BJ3EPv6346Lxublu66eYXnmyGUxwcZgp2XN1HTpU1os44g8Mq4EITxUa+93hnl37on+zxs5MUTU
	gEaMB+zj1FaHCgTr9gTMrumkUVqT7fvzzQ840pa2GVOrSJTs2SdxO/0xm6LTR2hnJMBN3bb0Gq3
	mB+B2iEGNQYFZikepAP6xv6IHjGjk6zoafvkxxg8WD0UUyvTmd3k5/F64UXJQSpwaKHz1xhX0=
X-Received: by 2002:a05:620a:6cc3:b0:93c:6028:6d2b with SMTP id af79cd13be357-93ebd208cf0mr636124685a.43.1791596993106;
        Fri, 09 Oct 2026 18:49:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm316485585a.35.2026.10.09.18.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:49:52 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:49:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: mosafer <mohsafer@gmail.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rafael@kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	khiemtranzo532001@gmail.com
Subject: Re: [PATCH v2] driver core: complete deferred binds when
 drivers_autoprobe is off
Message-ID: <0cc7fb74-aa32-427e-a931-dcbac7ffdcf9@rowland.harvard.edu>
References: <DM06HWVAFSOW.2F050J0BT27TK@kernel.org>
 <20261009182239.283329-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009182239.283329-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>

On Fri, Oct 09, 2026 at 01:22:39PM -0500, mosafer wrote:
> On Fri Oct 9, Danilo Krummrich wrote:
> > We've recently had another patch to fix up cases where dev->driver is
> > pre-assigned. Please see [1] and the corresponding thread.
> >
> > IIRC, there was no reasons the remaining users can't just use a proper
> > match() callback instead, so we don't have to worry about those edge
> > cases in the future.
> 
> Thanks for the pointer.
> 
> I had not seen Kien's series; looking at it now, we are attacking the
> same half-claimed state from opposite ends: his patch makes the release
> path tolerant of it (skip klist_remove() when the device is not bound),
> while mine makes the deferred bind that usb_driver_claim_interface()
> promises actually complete when drivers_autoprobe is off, so the
> half-claimed state never arises.  If the direction is to remove the
> pre-assigned dev->driver users entirely via proper match() callbacks,
> I'm happy for that to supersede this fix -- I'd be glad to help with
> the USB side of that conversion, as I now know the claim/bind/teardown
> paths in detail.
> 
> Until such a conversion lands, though, the window is still open in
> current releases (syzbot hits it, and any userspace writing
> drivers_autoprobe races it), and pre-assignment is not only USB:
> drivers/w1/, drivers/phy/tegra/xusb.c and
> drivers/mailbox/zynqmp-ipi-mailbox.c pre-assign dev->driver the same
> way today.
> 
> So please treat this as: whichever of Kien's guard, this bind-side
> fix, or the match() conversion you want as the canonical answer, this
> patch is yours to drop or pick -- but happy to have your steer before
> it evolves further.

IMO, we do not want the system to limp along forever with the device in 
this "half-bound" state.  Claiming an interface should cause the driver 
core to create a real binding at some point in the near future.

This should happen even without automatic probing.  For example, if both 
interfaces are unbound and the user writes one of them to the driver's 
"bind" sysfs attribute, both interfaces should end up bound to the 
driver after only a short delay.

Alan Stern
