Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D35A3F104B
	for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310601; cv=pass; b=Km2JvKxYGoBR0rEsVmL290WKSIXYMJYd2FIUA4S3vK74/5rVXAF1OWUUOOX/94c6qfwrfaOVZhQqGQR9YNNjfBVWxmJe6L3wMnCFiKW33F8anp+1hmVwjhyuoduKxCJETKAQO2k9fCqa8rpcZD0T6PpyobyFFxsoqG1KWrGdgok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310601; c=relaxed/simple;
	bh=s50I1f+RlATnyS7ncxttVC4STee39n4jtfw1TIV5Yo8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ps19FSCw82rm3VcUjJLv1dS4mAFoxvdv+VE0gNNKdsagCvHYqSf/noYAFfjPntEXFaWQXZAFJ0Yra9uI9snibFZGVYf4yZgc24l4VxVeQzmw8Wg6EBtOq3vy0wLVb+I9VXkWTRTXUEwhrSI+O69qmRQmjhI/LDi7G74zcwb42e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvcHKyIF; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvcHKyIF"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso840720e87.2
        for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 07:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789310597; cv=none;
        d=google.com; s=arc-20260327;
        b=s09P0g1Xw2F7s1SgPGJZOdxL2vwl+CvVF/h5cEaTAqTuXBTYImiNwGVZF4AUGmYSgg
         BbhH3+qEgInPQ2kc9szK9qTHPijyigD1jWEE/v1ua+PbJ7YxaglgoefSTGsbcUhryUvB
         xucUkIk6fhP6HRpXjS99WJmaQzIdORCWieGFBtmKnn2B+OrMsM7Vlpu0kwndPHwZvbsq
         X7aYEI3kdWQGCmlcaYZz45d2kevE2ovYZPZ7ZXfEiluGlzGY3QdD9JPdvQdiKbifCPS4
         DeBJOuOndWe7pau7pifKhlN8x8TOgZv/5jys+hfJk7A86JQqIgGPgIWM++Ltg7O2vwPA
         Ts4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gDlSeCeZClgynUnsugyjmVlBCsPDuPwIPykfDcGyfzM=;
        fh=eVkaMDVLH9lo5mu920IsFVwnoskeXYSro91FJVBAAx8=;
        b=r8QOct5mAM6vn0i72bxLV4x+Oez6yeIQCk0fTUKWMEJpEJlK06oSm3Iv3AV2nQP8tI
         +QxEMvDzhhf/kSZSz1XkAoNgAYn96O8+eBZemvuu8D8Z9lkQjPwOoZPs2Od9MkxiLokf
         xs/tjOV4pca70AehPGJMvOqXhAZnTJ7aLLLBq3pPSkb119SJ7D7324J2Lj6IE5ZDg+Fu
         AUzHs80EkZ/PDWmS/PFcLY8E0d9DlDR8/gm0a9fuSmVRg11vk87HGUGj7qCE5a3fifCt
         YWhCfRn4MvREhoKizo6xzZ5VuhtmY/X4eqOPs8pZ7X8SgK2X+VF/nr3QPvdLBRtLWRYE
         mIlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310597; x=1789915397; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDlSeCeZClgynUnsugyjmVlBCsPDuPwIPykfDcGyfzM=;
        b=nvcHKyIFjwetpt+UIfbM7euByDk0eNStjkwMFQ4b7XFZcZZBN3iJcQbxMGgz+LY9d5
         pILGpAhnNfEJW53MYMCQpHYbWbAkoiK/aZogrrfblEaulAYIsoHHgrtuWcR8hhq73BTg
         Epfm1T9a+D+rERsSaWNmx606IsHaiZ+I97qe92aQY8zsTizSXNdHHJ6drnmwrEkT4oCe
         rFZ/lGwb/SHyTjQU/ksTVoEvjr7zetN8O65qCP/ADamKuviosWrJgSN58yp25DLUB0J8
         L+diFSLbb7v5Lgbktg2oXkxTTZyemGVsqGMzKeXdd4dfn4sbRpeJ5HPf/MR73RkZSnZb
         D3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310597; x=1789915397;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gDlSeCeZClgynUnsugyjmVlBCsPDuPwIPykfDcGyfzM=;
        b=UYNm4Sdp4WeywzAf9bkJVOYaZq+TyHTTsesQZuTVq1wtIRiGv5IJ9DrRxL/9AIjXLD
         yf3Ilnx3R3dKRkAWSH8PVDw4T4bO4aMVz7TyM/u37G9SF5pZw63MzR/zLt7s32h+twSC
         eznvN2Zh7ym/jOjVctwcNk8vcL/BcAI1eP48qtZcRKEYfSRmucGwse65R+PEN2RfJyzl
         VJ8N3CEeH2mbYocm+TX04HP+ZvHjlZR0myTh9jow06wMdukpJCGhItpzsb6fIRpxkUvr
         IlYxYUQZb8pvTBJhlknmNNk/RJUlrOkHRN1f3w6AfU5ilkZ8kOSVUBeeHs9D4Cb5xtIW
         dYGg==
X-Forwarded-Encrypted: i=1; AKwUvBwCyuchR4X4YX8NDjdd3c/7pekNC5LMbYwJS0F3uyJPXaolBafqo3XOOZ9nZaGq6Y20fwsMETsa8JsONw==@lists.linux.dev
X-Gm-Message-State: AFuF++mm1xhbDSNvm26xaF88XgZNwChq4IBza9I9MhWGhiAjpk53GU8V
	Val0v4c+bTsiu4L2UlTV6wCdsw7vyPkK1ZokXQoX/RT7ANYq4m1wg7lD3bPWNZfxWAsTzDZH9RL
	ITNPtmFEVNlbFJM7kpjKRvrxIwsZU3tA=
X-Gm-Gg: AYBFou1NHhkKjKAZqHNiwpvWsVmC0KTja4yfyCw23cob9qoIwA6949Zsnx6NepDCtG1
	Jz20vspUEN+10jGmNPfyjE4+RizsFlpTSZVO62xDAcNQEHZjKggXtSuMPHMe8fdlQ5ns/E5Fl+s
	umXo6RLenof4QLzm7pM5vvk/Z12VJs1opCiFo6XGNpTolOJMHJRjpvdawQNd6UHryLBrzbLKC9t
	tZTkR5oK0WecCsfP4eYAtZit1hHkSGtFzpCD6PBitUGFxdZUI6kSTLsxuPx/6D+dIY1G825M5L1
	dNYiPoFN0rsh1S2SdesX+gtNX6ps740p3xIfE2KFdk/VsjYLhMCbmtsCttQt/tkyWtOeXBFRoDx
	BnM2xWlTiJIy6tKg=
X-Received: by 2002:a05:6512:108c:b0:5b7:6682:17b8 with SMTP id
 2adb3069b0e04-5b8a8ef6a7fmr1282624e87.37.1789310596997; Sun, 13 Sep 2026
 07:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sun, 13 Sep 2026 22:43:04 +0800
X-Gm-Features: AcwNN1X5pmsda_UiZ5ntCUgJCNHKWL9vQ4K7aO1nbiEQVANFLK5Pbt5CxzkS2Uk
Message-ID: <CANGjgdn=H50AaA-+O_GA-hkE9UwLANmkjx1zRsKUzxF5za8VfQ@mail.gmail.com>
Subject: [REGRESSION] kernfs: empty cgroup rmdir latency after
 delete-notification changes
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Jan Kara <jack@suse.cz>, 
	driver-core@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi T.J.,

I found an increase in empty cgroup removal latency across 507d8ce13f5b
("kernfs: Don't set_nlink for directories being removed") and eea5d2bb34ba
("kernfs: Send IN_DELETE_SELF and IN_IGNORED"). With sched_ext disabled,
rmdir() went from about 6.5 us to 9.6 us, an increase of 46-47%.
The result held in two independent runs.

The workload creates an empty cgroup v2 leaf under a private parent with
the CPU controller enabled, checks it with stat(), and removes it. It
places no tasks in the leaf and does not register any inotify watches.
I time mkdir() and rmdir() separately; stat() is outside both timed regions.

These are consecutive source states, not different release kernels:

  base:   f917dc56060a, before both changes
  guard:  507d8ce13f5b, the nlink race protection
  notify: eea5d2bb34ba, plus the deletion notifications

For the second run with sched_ext disabled, the medians of the nine
sample means per boot were:

                         boot A       boot B
  base                    6.504        6.528 us/rmdir
  guard                   6.956        6.922 us/rmdir
  notify                  9.553        9.558 us/rmdir

The first change added 6.05-6.95%; the second added a further 37.33-38.08%.
Each run used fresh boots in base-A/guard-A/notify-A/notify-B/guard-B/base-B
order. Each point had nine samples of 128 removals, after 16 warmups.
I used an i7-12700KF, CPU0, full preemption, the performance governor and
Turbo disabled. These three kernels used the same toolchain and configuration,
apart from LOCALVERSION. I used the same control binary throughout.
Removal sample CV stayed below 3%, and endpoint drift stayed below 2%.
The result also held after dropping the first sample.
A similar slowdown was also observed with sched_ext enabled, both with
and without cgroup callbacks.

Separate, untimed traces showed 26 kernfs nodes removed per leaf. The
guard change doubled the attribute write-lock entries from 26 to 52.
The notify change added 26 inode lookups. A return-value probe found one
directory inode and 25 NULL results. These counts do not show how much
time each step costs, or that a lookup returning NULL can safely be skipped.

I understand that the notifications and race protection are needed.
A local root-reuse prototype saved about 4-5%, but did not recover most
of the increase; it is not a complete fix.

A separate v7.2-A / 2f0c1cf72f46 (7.3-rc2) / v7.2-B check gave
9.919 / 9.719 / 9.953 us/rmdir with the same control binary. Mainline was
2.02-2.36% faster, with sample CV below 0.75% and old-end drift of 0.35%.
Both versions still removed 26 nodes and made 26 inode lookups per leaf.
The later name-hash change was on the measured path, but this comparison
does not isolate its effect or repeat the exact-commit test above.

Results, configuration identities and the tested workload:
https://github.com/lcf0399/linux-regression-evidence/tree/b1eef2a0fb18babbf8e0d5832b63a655bfd28926/kernfs-empty-cgroup-removal

Do you see a safe way to reduce this per-node removal work while keeping
the notification and race fixes?

Thanks,
Chengfeng
