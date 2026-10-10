Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6237CD21
	for <driver-core@lists.linux.dev>; Sat, 10 Oct 2026 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615660; cv=none; b=nvipIq+u2mYRlJ27Cj7VuCd8IWeAK1QyiImGBliZJOSr/yF1o3BlbrYdpBl2e7R0tkAmHLZZiBJJH07P9vQmZczW4DxhIWQo/+6sPjTJ3gUTKgKI1MCRjQ2tLKzBix3204NxXaEa5TdlqoBqmHqblKBzZWK+E0B5TwHRVsdtoMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615660; c=relaxed/simple;
	bh=F/o+CB+c764IJjLKKJ/Vq/hAsz/74K7FVfCJHTirPPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cS4oDfxPYflBuTh8NvG7zJruHlaulKrmaZCfQVLx5DTRKF7uVt5XyO5U3HCy1mrXj5F0djGZBFtdk0vInA2JKUI5YrU7YpTVL/1mR/LRoHbLKS4WlpPisb1nP18AXXCKzstrjtTeGspEWEt5PfI1OSte/KKWnioiHGckI4hf784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdpboJvD; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdpboJvD"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-917c04630c2so6992936d6.3
        for <driver-core@lists.linux.dev>; Sat, 10 Oct 2026 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615657; x=1792220457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBFXJ6vukRDHY7fGAWooctn5jSYzAGKP6c4NuLaCWJM=;
        b=QdpboJvD4qWBj9NfZzdpqStE9dgkoHJhg33CaUvB+Mpj6kJ//8aCbVgYyxVJ8mjC4S
         dyZ7hVEwsA67tbbqCU3Ka1R2ct4WqZ5x/4NKtY77dUgBsCjs0hRfzd0SE4DsspU3Odo2
         wNFK853BwdJN93Y9ERrLrDg72WzuNSHTHRCf0BMvm+/qkOJkoba4F3tPwMdGmwfvMFuB
         kzJDpDvLLqgf/wQdBZDSarfWGS0S/OPBz98igiesbKF4KUDn8vABbpoVbTWtv7DQKB04
         zRjgS9hTeHszVjSR33rKpHiv8W0x0Uq/zKjFRo6Be5Hu+twhgUmtprdldwhtg/FHjtf6
         pmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615657; x=1792220457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBFXJ6vukRDHY7fGAWooctn5jSYzAGKP6c4NuLaCWJM=;
        b=W6vLpK5qn9xH+io9pascJ3LKjlcfYx52jQZZ3PU+OYLaVuX4X7Tc/tv/yrD6IQYVI6
         wKIryqgn3pcu7XUoFVPeLFCvz9rQ3C1sgKATilnOaDC94p975i9ExPtgwYyPa+mVK94i
         DztWJd6ytBaLzRcX/iAteszr9XEIprYkGl5kyH9deyeU1h2QzLR9d6kCG+sg94Fi9DpR
         L8G0/iSZK3os6MQKwShYmi9SPnQ5pjsFCMavtlhOSJND+g7CKx/tugDot1jlpVfqCHlg
         +sp5QQJCUEC6RWdrgfCYymY6s7LsL22iurAAIHZ8daZ3+ootyvZRFzVtxUG5F3GoH208
         Fhvg==
X-Forwarded-Encrypted: i=1; AKwUvBxuFPOJNHL9h+7LobX6oKuiOfckKy0zoGJB8vK41fEn7T+Fy5ngMTjUmhT/vKV48sK14yDw3YJdF5H1zA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKPpD8EvZ4wV27MBstHsYc2TEW/XxQ4+JDu0ZmcCH6/+ITsOKKE
	uL7QJemRsEJM15+g6M86PvlCNNGJC87ikOWdYp18IQh8KLKLsjGFT9CX
X-Gm-Gg: AYBFou0hnvu/fjGl0eZx00y//3xRjSuvGWCX70X3+8zeODg9OgwGvxuZ+bfKM065FxN
	jNuaDe7oiZhFNhCu10MDuRh4MwxpWyhvsmhJzkixs3R1IggkbmEU9qL0HlCWBA51lgl662ZtxRN
	VIAQtS8rnb1ZtQR3d7WtYGqzeyIAF9x5QjSNxPxxgTJtC1qVD10rAd0124mlDbglH2HrKcvPzoR
	R35VpKL0YjMCQx3FuV7mh3F1XJ3pfY/3RLTkSzuhyX4ldSBXeAU+W90NPunXBtxzfbGDGrcsXVD
	/AD2Um3H1zQJjzYfeSL5fv+CiNrH0ioQPtgWyBEhBPi1decJDSiySVpHaMMNScwpZhHCYnHK++k
	AiBUM1t0SXOEbYUtgklggJ2k3/SOKxbJpZwoQc9LkgIVZP4AX1I8iPNMSQMlmfcpgkvoxpVw4O8
	Qc6ZJeJKm+CQOKved3k1f82gCL3wG0kDUX8ppHfJuMhdmKq+0vzR9X21iuGZHdJlbeeHKd6MiYw
	KPdQCKO6hDH3mxG+2QXL65FLeCR4uIR5Oig+0ovRlKWORsCs/0AVN/yqSdGTHfn+Kz/PT6qVjKD
	LVTPuDmjB3KzHS5QtKDpTuY/NYLKMMy9rUG4UGTkhfuyCnNCx7Uiaz78dlzmb8hg6wa+UEmDUjf
	yPyJPrvnTEepqbIGj33qq2WMUpX+fnRDVuRwHAF/U03EZwXHr30bsFphGadSHA+E3FFSoaGZ2f7
	SynRZHiXWXKapBnhdmXXnRS1em/g5U
X-Received: by 2002:ad4:5aee:0:b0:917:9ce0:b6d6 with SMTP id 6a1803df08f44-91b557bf438mr70044036d6.42.1791615657428;
        Sat, 10 Oct 2026 00:00:57 -0700 (PDT)
Received: from node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us ([128.105.144.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55082d87sm38108606d6.29.2026.10.10.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:00:55 -0700 (PDT)
From: mosafer <mohsafer@gmail.com>
X-Google-Original-From: mosafer <mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
To: stern@rowland.harvard.edu
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	khiemtranzo532001@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mohsafer@gmail.com,
	rafael@kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] driver core: complete deferred binds when drivers_autoprobe is off
Date: Sat, 10 Oct 2026 02:00:39 -0500
Message-Id: <20261010070039.288392-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0cc7fb74-aa32-427e-a931-dcbac7ffdcf9@rowland.harvard.edu>
References: <0cc7fb74-aa32-427e-a931-dcbac7ffdcf9@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 09, 2026 at 09:49:49PM -0400, Alan Stern wrote:
> IMO, we do not want the system to limp along forever with the device in 
> this "half-bound" state.  Claiming an interface should cause the driver 
> core to create a real binding at some point in the near future.
> 
> This should happen even without automatic probing.  For example, if both 
> interfaces are unbound and the user writes one of them to the driver's 
> "bind" sysfs attribute, both interfaces should end up bound to the 
> driver after only a short delay.

Agreed --- that invariant is exactly what this patch restores.
drivers_autoprobe is meant to suppress automatic *matching* against the
bus's driver list; it should not cancel a bind that a driver already
initiated by claiming the interface.  With the patch,
usb_driver_claim_interface()'s promise ("let the future device_add()
bind it") is kept at device_add() time regardless of the knob: the
deferred bind completes through device_bind_driver() under the device
lock, so the interface ends up really bound, not half-bound.

To your example: when the claimed interface is already registered,
usb_driver_claim_interface() binds it immediately --- it checks
device_is_registered() and calls device_bind_driver() inline --- so
the manual "bind" attribute case works today and is unaffected by this
patch.  The one case where the invariant was broken, and the case the
patch fixes, is a claim made while the sibling interface is not yet
registered and the autoprobe knob happens to be off at its
device_add(): the core silently dropped the promised completion, and
the interface stayed registered with dev->driver set but never bound.
That state is beyond repair from userspace too: writing the interface
to the driver's "bind" attribute cannot complete it --- with
dev->driver pre-assigned, __driver_probe_device() returns -EBUSY (or
the attribute path rejects the device if it does not match the
driver's id table), so interface teardown was the only way out --- and
it oopsed.

The patch keeps the knob's meaning for devices with no claiming
driver: bus-wide matching is still skipped when autoprobe is off (the
check now sits inside __device_attach(), evaluated under the device
lock, per the review-bot finding on v1).  On the reproducer that means
the previously-crashing window now ends with a completed bind instead
of an oops, while matching stays suppressed for all the other devices
registered while the knob is off.

If you would rather the same invariant be implemented with a
different mechanism, say the word and I will respin.

Thanks for taking a look,
Mohammad Mosafer
