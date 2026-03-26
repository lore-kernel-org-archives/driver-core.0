Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E628C405ABF
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542672; cv=pass; b=qM1lpdBv5Mx0MKxEBwhl/dmDNgHWYa96AHGRU+ZnX1k4vzrj9tRJ1zXbikUtKM3prQV46gtU6X8zU1igIetxKV2UH/e7j91gOolUJBGB2oxtgGPQqeXMBST96Z8pQCW3ZJRYmDq/XZ17HyZyHLdWLMNqbpPp7u/PN9+NGnjZt/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542672; c=relaxed/simple;
	bh=BZbMBwHrp8whhIaCRPg1ZjbDngDwiMRAEfXI7t9rAFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVQuKBHTt8pkSywdA6PaAJy/IaC1qQ6ba0SAO58u5B+MGHtiU44njcZk5NWTka7HyIu01VCMatMUzTiF9gNCB38WxHN2AOdCwMV88tFShZMQPD1q1A8klWlPwTR2sxi68c/yjpqZp4AeIM1MrPCgR3fEQKOaZKejp9QIjwjhJT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNT8ztNA; arc=pass smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNT8ztNA"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43b4d734678so1034479f8f.1
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 09:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774542668; cv=none;
        d=google.com; s=arc-20240605;
        b=EifWLMDIdNtzuMP9AUQMaRwXY93t/5qm+xQi70JBQPcKsSkfaRg5E9jCizU/TeEsq4
         Iv6k20OZbMgux7yiUuxghvD3k25gr954vBB9r+hmBva5fkmahOUUEDE12nBQzD2BLRub
         /VWxBqXE4UYf+B9QvsJkhbb3QUAzyYH6g08VRgvxv4W+foOF9Yw1RJCwEo+6N8kfSZRE
         tk7z/UpADHlFXrQ0kETE6x4Hop1uzQntSPIE22raYW1b0oznNg6v1xzY75gILRTY0OZw
         WnmqYG5GDeTK9/72YloO5lN2YgtJq9Vn83Riq28HIBDpVsfAOoYu+clRAMearqbn4AT4
         +H2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OfNm/O6t2ZnE/ns6CNZugk+zk3ym9aOAJX1Hxzo1H/I=;
        fh=Sjpt1pHWu6BV+0iqvEOmy7uUBpjKzumUuElqJuFFMvs=;
        b=P8Qdo6C5BuV9NVOOCrEQ/zV5YMVOKwVP3cq+7AOW75vsj8flFvbp//y/dF3EYQ1sCk
         mYPREpL+/POl760a/3UZtOMF8adzqW4pdmz7uFCHLrDJZC7LTwuMIHSfLif1WmGKhBgq
         CsDhucHPaD4MSJRbIoE1Jf7Ijg5C5r1ZLs5+BAS5NS7Vy9Hl3LSo4rnvmdASO2aFwsJY
         3OLzMIe32mFwg/lYVifLPoJxEUfazNP68mqXQDQsxDLYFgRjgX937b9TwUjcRto8a8aF
         9qCd3JBNTUyicOlJhCVRNSsf9SCYb3HxxZ/6u/rSobYf9DSdvpXeCQjkx//K26iQU5ll
         jHMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774542668; x=1775147468; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfNm/O6t2ZnE/ns6CNZugk+zk3ym9aOAJX1Hxzo1H/I=;
        b=GNT8ztNAE52UPpnV/00Z2yd4TONDFtDNOdvO1+dBKnJWVeC05bTt+JsVf0e9IMvuhu
         QUeLjFj0fNXmlB7hOrz89pncVLaGp0rrtjcFsIUJqOc7zR7+JhuuAcvKDlMtS8ocsLkP
         GN74nHiOnGo2/9juw8N66qui4ntILXislFWg6c9uDL5fx4nYcfQXxXY6L/Pb4Ed1S3kb
         dX8etKhD7vNuHXV+0WLoUk8kFueEzMH+ji06L8R0p7VlxA8HZY4XyvIP4INar/Fehu6x
         iROzrVOsPvtpkrBkCS4Hvei4FaDidGxWWhktZ4jnXxZsEU1jlcD09kfM/S7ZjTFSjQv7
         RQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542668; x=1775147468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OfNm/O6t2ZnE/ns6CNZugk+zk3ym9aOAJX1Hxzo1H/I=;
        b=iUm+Rf75ujfnoeznfJLMCEKcM7SBn1LdfKKFUWiohD9zTRXifQrtPI8VpXe99WReq2
         vQbjaL/ceUhYggBKE5bmo89So0U2O+UETDbboxnYcj7HnfDWKaZX6OaLVPs8Can7dI9t
         Wq++6PFUXNt88P234c8lRQq61/aZ3asmDafoY/0kvxlo+JGicbnOLasX75DnSzq4i/6h
         URAsk+0s/Qmp6QOplJYpBBM0bS0X5up9Ni/X53WS3LtkniJD+vEz3GMHAZHY05WQc7l3
         Ju+HKV3vu7B3KMD3K2U7/NWnwTzBknxWdgF1fE+97UOvB0pJkgC3WRMRDivWJQ2ucw1A
         5LFA==
X-Forwarded-Encrypted: i=1; AJvYcCVlQjjeWNZ4K7rJS6qN5BlT0PtAcu2cyZTa0uUYZqKpLDEwghpGMgmhKp4/rrR6UJTMWIArbAcu5iDu5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/dHY5oFs+X4mvbSq63163W4VFMgGhA6ymR6AWgIbxxGnXQ6YO
	9rhV6/cpRstPeKyPYZbLs08ZrUk4orIcGifVln62Pol6w7W413KHKVtCWchXfdaJ6YCJMl1VvbT
	XWGVzA6Yp87QkT35BhNWyvKfEB6nPQ1I=
X-Gm-Gg: ATEYQzx1FLskG35JINdWM6LQaWZYjEBlZusv3cr/YEeROtGQR2T3uYrmgKkjzGBB4FO
	WNH3Qu97SV5HeyBuV3TMSflyYwjJqMDQPssn9cr64xzGlfBKfaOmDUarSzI8deVixWa5jBDBj6Z
	PuBwDMuoYOlTWFeMjleSyJCjHce4hYI/LKdwsim3fHeqhjgFYS6YdLD1B2IrWkNrEE7WVi3FfkT
	zKpaeJqQyzKmE7YSmHU24QfnegbjBSEuwgx9X/ozM2uovRPy3aiU1orjVlyTq9SLUtwwC6+KAZC
	vRPW3p7JCCQVokIAvP+xq1AfvIN7E78iVIBEd7EdsO5FQHcbh7qxFIK33VVs
X-Received: by 2002:a05:6000:2481:b0:43b:801e:488e with SMTP id
 ffacd0b85a97d-43b889a8389mr12816871f8f.15.1774542665963; Thu, 26 Mar 2026
 09:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260326112521.2827500-1-wusamuel@google.com> <m2v7eig4ue.fsf@kernel.org>
 <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com>
 <CAADnVQK252XxmxM3enS4wPREshTEawQKbChgN-teX3+wmxgdBQ@mail.gmail.com> <CAG2Kctqd4p4pJtH=tSfKT57qfecQrpcoYu3SsAzJ-zGEiYVSQA@mail.gmail.com>
In-Reply-To: <CAG2Kctqd4p4pJtH=tSfKT57qfecQrpcoYu3SsAzJ-zGEiYVSQA@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 26 Mar 2026 17:30:29 +0100
X-Gm-Features: AQROBzDVtUgfqATd7rCHJdNRaOBCw4LGtIxgfT_E050yYf4i43poQlTnNZclS14
Message-ID: <CAP01T76nRgXf9XW+6SGaJ-N2iZSFj6E8--p5mtBB__czwvDUag@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Support BPF traversal of wakeup sources
To: Samuel Wu <wusamuel@google.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Android Kernel Team <kernel-team@android.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Mar 2026 at 17:26, Samuel Wu <wusamuel@google.com> wrote:
>
> On Thu, Mar 26, 2026 at 8:02=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Thu, Mar 26, 2026 at 7:54=E2=80=AFAM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> > >
> > > On Thu, 26 Mar 2026 at 13:20, Puranjay Mohan <puranjay@kernel.org> wr=
ote:
> > > >
> > > > Samuel Wu <wusamuel@google.com> writes:
> > > >
> > > > > This patchset adds requisite kfuncs for BPF programs to safely tr=
averse
> > > > > wakeup_sources, and puts a config flag around the sysfs interface=
.
> > > > >
> > > > > Currently, a traversal of wakeup sources require going through
> > > > > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls=
 to query
> > > > > sysfs is inefficient, as there can be hundreds of wakeup_sources,=
 with each
> > > > > wakeup source also having multiple attributes. debugfs is unstabl=
e and
> > > > > insecure.
> > > > >
> > > > > Adding kfuncs to lock/unlock wakeup sources allows BPF program to=
 safely
> > > > > traverse the wakeup sources list. The head address of wakeup_sour=
ces can
> > > > > safely be resolved through BPF helper functions or variable attri=
butes.
> > > > >
> > > > > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing=
 ~34x
> > > > > speedup (sampled 75 times in table below). For a device under loa=
d, the
> > > > > speedup is greater.
> > > > > +-------+----+----------+----------+
> > > > > |       | n  | AVG (ms) | STD (ms) |
> > > > > +-------+----+----------+----------+
> > > > > | sysfs | 75 | 44.9     | 12.6     |
> > > > > +-------+----+----------+----------+
> > > > > | BPF   | 75 | 1.3      | 0.7      |
> > > > > +-------+----+----------+----------+
> > > > >
> > > > > The initial attempts for BPF traversal of wakeup_sources was with=
 BPF
> > > > > iterators [1]. However, BPF already allows for traversing of a si=
mple list
> > > > > with bpf_for(), and this current patchset has the added benefit o=
f being
> > > > > ~2-3x more performant than BPF iterators.
> > > >
> > > > I left some inline comments on patch 1, but the high level concern =
is
> > > > that encoding the SRCU index into a fake pointer to get KF_ACQUIRE/
> > > > KF_RELEASE tracking is working against the verifier rather than wit=
h it.
> > > > Nothing actually prevents a BPF program from walking the list witho=
ut
> > > > the lock, and the whole pointer encoding trick goes away if this is=
 done
> > > > as an open-coded iterator instead.
> > >
> > > Which is fine, the critical section is only doing CO-RE accesses, and
> > > the SRCU lock is just to be able to read things in a valid state whil=
e
> > > walking the list. It is all best-effort.
> > > Open coded iterators was already explored as an option in earlier
> > > iterations of the series and discarded as no-go.
> >
> > kinda best-effort...
> > the way it's written bpf_wakeup_sources_get_head() returns
> > trusted list_head. It's then core-read-ed anyway.
> > Ideally it should be trusted only within that srcu CS
> > and invalidated by the verifier similar to KF_RCU_PROTECTED,
> > but that's bigger task.
> > Instead let's make bpf_wakeup_sources_get_head() return 'void *',
> > so it's clearly untrusted.
>
> Thanks all for the fruitful discussion; this is more rigorous. I'll
> update v3 so that `bpf_wakeup_sources_get_head()`'s return type is
> `void *` and I can add a corresponding selftest that directly
> dereferences the head and expects a verifier failure.

You could also use bpf_core_cast() instead of using macros to read
every field, should be equivalent. You may still need the macros for
bitfields but it should work otherwise.
