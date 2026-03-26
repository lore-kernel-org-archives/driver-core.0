Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A309D3FF8BC
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536853; cv=pass; b=Fc4JQIpvezmrePwnPgpp1m3ikRrTtXoD3z2//BcodtrH041R5Z07p4ZCTMpawAxuXPR/qdqOVRoEQhQ5hjB3uRvoFmaaWKQ5VPdqQ8IZe1UILbHqqqAHqnEv7EfZnDQG/+7WC9U9kCxq4T23lOfDaN/J6gAlwbJGLygiFVWWFRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536853; c=relaxed/simple;
	bh=SEhU+8FyrhCQphBxGSGzxRvEz/UtCwkE8r71m2dkSA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdKDbVoC4Ur+ykTFu3vS8HHV/NlW6FIlVCaY0Tk9L/Ws/3B/oRgPP7LTFcipghfaBGcjvqaFA4ZqeBYiSTRbDMIFzYtZZM8tBI/jf1sydlvheMbp1i0TCIws2onU1qOhn97SRmguYPcsf04AvelKWFnFiEQVUkGYl8kVeUseM5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UL/nDeIP; arc=pass smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UL/nDeIP"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43b9144790dso598571f8f.1
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 07:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774536848; cv=none;
        d=google.com; s=arc-20240605;
        b=fIfO945ojmOQ848ei45R6uG5qQDYTtbatl8Gwn2DLaLhk8KOupR7t+dK60ZdbaToKc
         vJMDkRlCzFxIIVlcfCBaQwaMEvjx6GuUOjQ8SOkWv5Q2Bs7NEU6mXZQnZVu3SfUJNuO8
         +TPWvYeom/7A9kY9fM6tjaPlESh3JvKX6Vkhwai933Tqp9BTk41VEX+6l3t7jTSC9r67
         rdApGUfREO/WgGLK1P6pkklXFsOkT1nfUWERIIXo3mLAl/5clrUl5z02VBmUF8fSiZqy
         SogI0UwPUyNnNOwOltaVtjTtMeUCHTw+dNVjsEbR29iTyxTozR1o3go5690PI9skjkfL
         iGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FhuoiHNS8EWtKNqoBDqtr5VoGO7JWS8fa9w/yw4hw+U=;
        fh=B3fOkJVfC5p1VW4UeRU9xsmcjUeW6LAwv/u0jm6f6ns=;
        b=ebcEic49+C3cEvfBZ7ND3V+A5mYnklYLOudaexfyo2sMr6JxN/mfMz5/nQAO4rOuIc
         a95JwRIRNIi1vsWSUhJxwZmJLO/FuXgMlM98WvaF81zxsRcVwN34Ys/X/RK70v7l4OoX
         c6fHJHwCHLdM5spbuVnTq+0rs5Kt+A3XtaUKZx7QwGAJUmX7SfBDshSiNd66qNZDKtFQ
         McEINY5pMhTmu5knsK8T8OY/0wsCt8Cnlo3Ul4M0kjnIMlKQkfuEYVgUaVr+wR8jyraI
         KYb22Scm21cg8YSE8yqdPXtHW5wfvERC6PlUvxzO1vbjFknhgyWG0rDiNib6i+5NNWZJ
         Qt2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774536848; x=1775141648; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FhuoiHNS8EWtKNqoBDqtr5VoGO7JWS8fa9w/yw4hw+U=;
        b=UL/nDeIPxUswYys/n27/mMhWZyLAwtcj1hW5g05yft0RmGaMMu6dOd3ZOWjobIDeVp
         v04pqK59n2qPMgx70sk0mPmVHqE7U46oNpZ6vhBlTk8akpgBifcDhRCAG4ZBdpyq3kQ1
         MaCMuekXfkEdMfHGrXmS9qXTjEBX7ptXgLApzInrqG7C2FVvwP1qr3ySlpM5nOEatqwR
         XGU/j5vgeYuBwYFBsovmJjpfumwjTNBIGn+Vt0LE+5NhIHlSjkcSbLFcxBv9tUqtUMbI
         nznGqR20pq4Gsa29OnonvulXcT82+Q0HIPszlKa3QJIyNAuBGakJwkmQgAz+Jcov/muh
         q2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536848; x=1775141648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhuoiHNS8EWtKNqoBDqtr5VoGO7JWS8fa9w/yw4hw+U=;
        b=sHhDc88tFIMZz7i0Jwna/l3ShtbHCkP0ukH6wQIU78AmQpwcMq0L6abLjDBW17ZWPp
         su+5z7VSqI8ixatnBbns5eg5R6A1IUlyDhUr68AdpJayDV1vPDfAYu3+0o8fjeyeimUX
         V2AhRXkKmBFDB/Z7xDNVlIc2VzCrwLkLAppfFtYktzj4hfT6dOhfu5VUFLH59nX1zBR3
         cL/guJ+r0ScC64ksate3qjh65gqEVKCh0lfLmLJNtQJ8h8iPGeIpxnuiWDjqKtPCuXox
         MRZqK8xIa9mJ5lXGqmiRTE4zD5CCaHvQd1jwy5H1CdX9r1wxL1QrVHi2Q4TK1ejv427K
         GaVw==
X-Forwarded-Encrypted: i=1; AJvYcCWBx4i7zVL3gV1Rxrs7GXIkL/oBcvG2o6hBOC0ouE7QaSZlvp15l9mcziu2Zhq2qnh8rbEpS7kzSj6cqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcDUuiZrJ5I3P377PYoVW2QHYF5TePPnEgifth6SQDryWPTnso
	AU2DwLd1+yRVh0lX5nZoabAKWjsgMuZCoczFs4cpoAzt7CgO2mQc5VqXv6qbT9mHRbfufdH8cUR
	JKpac6NbTJlyya0VPh9f7SpJ/r0CWYmc=
X-Gm-Gg: ATEYQzwWZbWX53+Uba2hn/nLyQcOONmGlX2pPVa7e/IPEVa7Q5uNB2L2ORsHStT66dN
	mogRfmh9+JoP2jTxQhKHXtKwGnU7Z1mZyu4YpZuMi1OxqN+7r+VQGpzTQePKimcS++ob22O6Z07
	Qz7rpKMlK4IpkLamvKXQXCpp2cupaIodvNDrXqJY9KT0VUJ+XU/w2f6nwrrfMMNsGSA/SbubUpZ
	w3/BvxVP1ftRBl//tvl+md/q2xZyRK0HczdzcQFLry/bkmi6lFUTB2RhI3oLR4jX2BibbrtpOrj
	992pfFoIOB0qI9JP5rv1B9mDWB/LZEM5QYgWaNqjF7nLQWzE6HjSLsKoU5tz
X-Received: by 2002:a05:6000:310e:b0:439:ba57:5001 with SMTP id
 ffacd0b85a97d-43b88a29247mr12274420f8f.44.1774536847553; Thu, 26 Mar 2026
 07:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260326112521.2827500-1-wusamuel@google.com> <m2v7eig4ue.fsf@kernel.org>
In-Reply-To: <m2v7eig4ue.fsf@kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 26 Mar 2026 15:53:31 +0100
X-Gm-Features: AQROBzDA_uO1pF648ctMN48d4pwbfgoV5WCFXg2YqxbpVDNoGL1Ww4jiqtlSmvg
Message-ID: <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Support BPF traversal of wakeup sources
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Samuel Wu <wusamuel@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 13:20, Puranjay Mohan <puranjay@kernel.org> wrote:
>
> Samuel Wu <wusamuel@google.com> writes:
>
> > This patchset adds requisite kfuncs for BPF programs to safely traverse
> > wakeup_sources, and puts a config flag around the sysfs interface.
> >
> > Currently, a traversal of wakeup sources require going through
> > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to query
> > sysfs is inefficient, as there can be hundreds of wakeup_sources, with each
> > wakeup source also having multiple attributes. debugfs is unstable and
> > insecure.
> >
> > Adding kfuncs to lock/unlock wakeup sources allows BPF program to safely
> > traverse the wakeup sources list. The head address of wakeup_sources can
> > safely be resolved through BPF helper functions or variable attributes.
> >
> > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
> > speedup (sampled 75 times in table below). For a device under load, the
> > speedup is greater.
> > +-------+----+----------+----------+
> > |       | n  | AVG (ms) | STD (ms) |
> > +-------+----+----------+----------+
> > | sysfs | 75 | 44.9     | 12.6     |
> > +-------+----+----------+----------+
> > | BPF   | 75 | 1.3      | 0.7      |
> > +-------+----+----------+----------+
> >
> > The initial attempts for BPF traversal of wakeup_sources was with BPF
> > iterators [1]. However, BPF already allows for traversing of a simple list
> > with bpf_for(), and this current patchset has the added benefit of being
> > ~2-3x more performant than BPF iterators.
>
> I left some inline comments on patch 1, but the high level concern is
> that encoding the SRCU index into a fake pointer to get KF_ACQUIRE/
> KF_RELEASE tracking is working against the verifier rather than with it.
> Nothing actually prevents a BPF program from walking the list without
> the lock, and the whole pointer encoding trick goes away if this is done
> as an open-coded iterator instead.

Which is fine, the critical section is only doing CO-RE accesses, and
the SRCU lock is just to be able to read things in a valid state while
walking the list. It is all best-effort.
Open coded iterators was already explored as an option in earlier
iterations of the series and discarded as no-go.

>
> Thanks,
> Puranjay
