Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416205;
	b=Hgtcv6bd8wwnW/a0dt6CTQhq82CNoaE13zDw06527U6Qgj4j1DL+2G04weALEd9aXQYG
	 eEIcWK17yubTVkw7yQXoIZ5eiVdQnmLyRaO00a8ddeg6vCyUHXnGLWpOIX050WJXo7ZR2
	 /3KEJ6tF3uura9sWhR/39p19lfpq3XG1SHahY5Mo/Eq34YefJUfndTN+GCGX4uAztD7oo
	 F0DBb2g1EOry2f5cAcKK7OYxAAeodE11/rTezNOqS5+zn0qnykE3YeUYKTjHqqn1Zqnmx
	 DeBQaEkAJnLgnqOLFncQm3R4HlonIrtXmeU0vz79I06C2kx9jcAUqq5CtVLWZJTyDMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Aqb51cKCA9gE4CD9ya0QHatgfv/z6SjRqePWGJDJD3A=;
	b=if85IKaLbbMGwYZl0UtnS4OMBD5Fv4+EwKta0+WjxSGoa2Rf5nZ9TCrbCQneXDQCGrhU
	 B4vpAqZTRX1woWEYw7JOo8w5qVhydaVDHvwbAKXbFAHIoFaZ2feGjt7r1hLYYz23Ly6L4
	 lHu5VkeIenUqqJupqh2FOA4J8KKvdfvf5RIHup6gd8ifdo926Xpybf4XsARenuklWqd+F
	 CMpoDqIvy9C167plXGWBYDxItcbpkzzExxZpB+m4l8Pq9jIq0niq73y2C0zGT/+PPTy34
	 WAgzv+6nMJNB/j5Us9+OG+9wXLv2pHjz2/I1LExOudSbo4LcbYbCpu0k/28GKmedXLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ZZ/htWPF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3734606A899
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 16:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3734606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZZ/htWPF
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c3fd91337baso563668166b.3
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 08:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416203; cv=none;
        d=google.com; s=arc-20260327;
        b=b/OZtG3o97vcZskPV/gawm0KsLhIacryj9ndE4t/AmiORCPVXDFJQNr9N1GFTdGLfu
         697oF5Vukd7Ej3oqEHeNaS5AmvEog5CrIosCkAqVxsgiszxUsDEVsneI+no6KapHQDKY
         mi8rm1ZhKcMIfvorevhe9kHZ63HCEDDlE1Ntd7rsAfTX8vJtOoD4s5u8+LnVZeEoHU2k
         VB2tjSlMBcZtftYy8VV2sptVIXYcCC0CiHrx2QkSMJutQ1kKhHMPcRMCiV2/MqG8zhzc
         2mV5/6qnLSgjK8vLtMGFhy/rWoHMlvUqCcDB2Zf0bpTV0Zi0Q++iOdZpSgfwNb0aoYp+
         NLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aqb51cKCA9gE4CD9ya0QHatgfv/z6SjRqePWGJDJD3A=;
        fh=mwAw7vks7reQRnCSnqMLdUlAzW9Wfx4rnbo0RorzHSk=;
        b=OTGt46CPr82vARrtLoFEqwBGOQEf2GAdXpFmc2ktukR/qeEnofHsd2Al/WKXl1L1oc
         D4f6aqhfkDHUqLgaJe683mKFB5tBoCkGWxUZjCsLYd6Czz+3f+lHNlK9VJggyXpw4Ut8
         Yx00MrbU9lUyFiIlYG4EKASxJKdRn3hw16iqJrllXyrO/p0+grxTYjK/EE1IVUyno26a
         N8ksb67N2c48hnOujykNviI7KCxFflYCBe7x5Ub+HcxvYT1fCB4sbdAZgT1+qgoC7E93
         TlJ3ObAH9Su7s21alHI982yvf2V/poXEmnYicq4jQKnyw0dOwwUYjnYWa5nEHdA9VLDM
         GcvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794416203; x=1795021003; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aqb51cKCA9gE4CD9ya0QHatgfv/z6SjRqePWGJDJD3A=;
        b=ZZ/htWPFPXiiBA1XDLNkMBmxuSlY/S/qmNLgroSE/iA5W3WCQavtJpNciQYflstWtk
         F6Akh5Itb5apzTbW8V4fKfOr4E8zb/kyYHVfvlVCmdZ7/PL5GrqalxzqVzXrVlDb44KB
         Sm8Ii8aBWH6TJBPlR9ZYvj03G/YKQUVSuhJfq2Zwqro6eepdM/guaro/WoErAF0oTElw
         K3rp36ABBRXyUimTm49/lRT1kVj0gypOCgGRnV2oZBm1ZmvhJ99wGaHOPY7DX9hW37/e
         SI73/RU22anBf7S5SCQKeLoJffTedwFD1l0Cka7vDbz2ht81WXwJcnNTdQhTQaBJngV0
         7OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416203; x=1795021003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aqb51cKCA9gE4CD9ya0QHatgfv/z6SjRqePWGJDJD3A=;
        b=KZJZ9W4PLQY7Vry6WnMN/j6a9Ca/2V5QUtIeTfNTOD2Cr3Sw+hdDAFXJaN/3tuIX+R
         TF/6ohQXU4EpVC4yguADKt4B3MRW3yViatkrrvqg5Kb9OOjRGSR7eQcGe2iBUIe5ub82
         8UAHMPrEneuG+hnozuiZQJbM8vxDBztl1awv/NlHSftlUOg1GF9oAUeY3tvhZ8phQ5JR
         kOe35RPvQuEJUo78L1Z282Jsc6HoPLCkQyoHvSPDnAAtW3HiCfj8gpq+H16YOw0i0XCf
         sSSjnIb9jASZcZ5JTogSVhF4Y4ptyR9bwqrFWBo8T1tJEJLkTAEGd8tqFW98xa1RO2U4
         VHMg==
X-Forwarded-Encrypted: i=1; AL+hErFh+lmvoP7XMnF2NrQNNaMiJsqU8itSswzT165LGxSh+ray9OoC0BskWhQjkUKoAihkizg+8fK7+/Y7ug==@lists.linux.dev
X-Gm-Message-State: APuU4Z+/+BI3pV5g5fwxXrMjEmP167DM+GxPhFjISZz0Um8uV7TcLq6y
	nRzPxX2E/5x2IUO4Wn7EJvftQFSf3vKkbupoBZ7jn+4X3dUYVKPIuM8LtCPNOuSAfTp3YRnkIPo
	9IOHJIdjDaX/hGZn3rNO/RQHo0bf8U8U7K+Nf2pVt
X-Gm-Gg: AYBFou3VDGsDc9qGfD34vS/gWodS+OlqaoqmR4j1lCStfc2ibB4/V94bGZJp1DCngXf
	+I9+Y5jR1mZns6OZoNOb/aE5RR8CIEPBrobUBIVsxFj84T95Uf5gU41QGaQB8CJnLgnHrSM5t2t
	QDFSruJpbhMKMQUc+TnRtZP2niwekePzmGhbC/CtqvGa5q9AnMHqijSPaKeEG17HJB5+3hWuRRA
	r3qEy9u1QcYiQ7RvwW0HkOXHcHb4MOJTUsmUcWlN7QwPB3ie7lw7FfA6TAYj1EewWuMvWbZJkgd
	XEL7w6lbhRwVLcxvGOX9dmnmi1bCws4WcDJraNCUkCvpdh/Z7moh3tyLy2aCG8pPVKiDmORyiHn
	G9wYTiQZysAaEYsypyHfzbK61Aw/aP+O3Dcj6fO4lDpLP8SsSVh2FM6fRXa4I8zAkEDm2eQ==
X-Received: by 2002:a17:907:a095:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c5066abbb12mr223619166b.12.1794416202670; Wed, 11 Nov 2026
 08:56:42 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-pm-runtime-summary-v1-0-12ebf283db78@kernel.org>
 <CAG2KctpRRDMXR8wG40PeohsTyAdoNC=+4Nc9pHGQc1fmw9AXeQ@mail.gmail.com> <20261111101152.00007785@kernel.org>
In-Reply-To: <20261111101152.00007785@kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 11 Nov 2026 08:56:30 -0800
X-Gm-Features: AclHuK8kdD8VwnaBbzLQVqTUgoqU_vlxOQj4ngzBW18PxropehXDJ3jwX7C2L8c
Message-ID: <CAG2KctqMYi+a-NZm7bAHTSc5Ch8=RAaEhY6CAZkvCnGW2VOeEA@mail.gmail.com>
Subject: Re: [PATCH 0/3] PM: runtime: add new runtime metrics and summary
To: Joshua Crofts <crofts@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 1:12=E2=80=AFAM Joshua Crofts <crofts@kernel.org> w=
rote:
>
> On Tue, 10 Nov 2026 19:38:39 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> ...
>
> >
> > What is the vision for using these runtime PM stats once surfaced to
> > userspace? Runtime PM and suspend have disjoint portions, but I'm
> > curious if you see any non-obvious areas where these stats would be
> > insightful.
>
> The main things this is useful for are detecting power "thrashing" and
> tuning autosuspend delays. Currently, sysfs only shows the total time
> a device spent in active and suspended mode; from an energy standpoint,
> a continuous 50 second suspension is different from a device cycling
> 1000 times for 50ms each (these transitions can be pretty power-hungry).
> This could help userspace utilities like PowerTOP to more effectively
> determine what is causing an increased power consumption.
>
> From the kernel dev standpoint - this is genuinely useful when testing
> runtime PM functions in new drivers (for example in the IIO subsystem we
> deal with a lot of runtime PM stuff).

Makes sense, there is value in this info.

> > And is there a reason the stats need to be surfaced in both sysfs and d=
ebugfs?
>
> sysfs definitely, as you should definitely be able to access this info
> per-device (and this is the way userspace tools would get this info).

Is there already a userspace user of these sysfs nodes?

Adding these five sysfs nodes would easily create 10k+ new sysfs nodes
(a typical Android device can easily have 2k+ devices). Most userspace
apps would iterate through every possible node, meaning this would be
an inconsistent snapshot across the 10k+ syscalls, in addition to
being inefficient.

These sysfs nodes would have a boot time impact, a non-negligible
memory impact, and constitute a permanent ABI.

> The debugfs summary is however pretty elegant IMO and useful. I'm sure a =
lot
> of people investigating odd device behaviour would like this (plus there
> are overviews like this in the kernel already - clk_summary for example).

The debugfs addition makes more sense IMO. It filters with
pm_runtime_enabled() instead of presenting every device, and the
spinlock at least keeps the view of each device consistent. It's also
more flexible without the ABI guarantee.
