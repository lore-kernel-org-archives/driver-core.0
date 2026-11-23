Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438671;
	b=jzln/6MdXz6rjPJq2LEaLf+r0LzVzKdgT5bGXhw8aPCe4DNgv1+kLz4GdbWuYNB4AwL4
	 p2OKzBkAoEVr51Oi8/hawtaoVyiB7bv9claGrP3Z8rSr1Vi3UnVmJIrzIEdgCPBAvUY4h
	 ga+35P36L28bXMc6/Z+bBAAnUWyxv7pxt3S4+6Gw/4HYwr0HcnG1q2lb8uiz1XwoJDMdA
	 qMP/KWEvS40n4zmiUrmL/JIfDFSnX4HyDbj0+pCaGw2ePH1AmNw6+s7AofE9rL4HDqHS+
	 g4uPkbqAdKf+UwX4wO1eiS2Pp5sOz1B0liAGkbGwfN59mJuEg2MDqFB/KMsSzqsjuxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sndCEp07Frht52v60gUrZGuFNtLHoYQT26fBAkqgHK8=;
	b=MuRwqqxQPRVRbBpzpELAoWBSHkR2kA9ErbY2vUPnKfJjJNl77oBvU8FqsuR0pvaDDGtz
	 ifqdfgCtN6BpM4UzeCVNi4hDfMLiA+nai5kbMUTi06IkR2lTSNpE1c7FoHCcmQ770PKum
	 03ErycTFO5VPWURwWKvz7bu333QfREGCnPqIgRLbzftm6W55fQQy+iFFjXIm0sp1ZE1iK
	 0kqq8JCwWE76ybTCH7/rHCUOtsc0QQnId6cKatSqKRKsMDU+QCMf1/FManp7RVV2Im7ho
	 hnmUWnJo+BtuFMbrjUflh96xvj1hBbkcRkGiE1Tjv2MGIR7RVfZneYgRZRrd0csl+FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vijmt1Yk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5E606A32D
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 12:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F5E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vijmt1Yk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so27403435e9.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 04:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438669; x=1796043469; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sndCEp07Frht52v60gUrZGuFNtLHoYQT26fBAkqgHK8=;
        b=Vijmt1YkvNGQo+zg6e9Vlq9ITcwKSRpkluy1lVe/6nmFAwpZSDO76mUBP+ehA9veuV
         gsAhGjkLBZbNPac8+sm/UskIXlJl3h1GX97rfNrnswNMz3tv6+NiyPMOoPqwsb7QCm1N
         hEpIc9UqEwNK6t2gPjHt7YPUBrDQGEdnVz0ogBOeoxprjtLu3jFnX7LRvoec5oUHUCMu
         sG5EGINNw82MtivVCkSDF2e5qPohakuJvCFqTwDo6SmTaeQYLjNmB3S3OCs3UNPesCic
         H5v1vAk0rfg5c3CbJEzw/2IhFIHw2p5+0qq4tEG78SDOQqkPPKyJ/5wybPDFdyk8IwB1
         xdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438669; x=1796043469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sndCEp07Frht52v60gUrZGuFNtLHoYQT26fBAkqgHK8=;
        b=ZZnVm2a8rSgWK4xi5TBISzfdENuszQL9/Jylm8s5pIz8gfCNqO5IzLf0QTk7NiEanR
         mPKAQXdUqfhV+g8Ldq4YEV4qF4tu9rdXGR/0yYuROVa3nvWOfSyI3Lp9onIi6pi/np/R
         7QfSGS6Jlm2TPqYxMyUjG3EfC33Pki9SXDPym5Vg3HXW8i879gBiRZ/tZ0JRBngNBv5m
         LGt5OySpt54SGv1Sfc4FSZTb8dLL+BGDMQLBPEnhOpUMyjMGlWvFpZbMZdf0zbFEr79r
         u/Om1y7FGwAglBA9Hu+/kPW4N7ceGDaKRp4YT0WGLtRel7nWrqr0IR/0u+EaSDKvyWb3
         uZ4w==
X-Forwarded-Encrypted: i=1; AL+hErFlPBSXpe4k6cvGLIfgCI8oXxZlNEK3DNchu2Agtqli9oUCBo0abXXZFpuPPzh21wXEEgn3nziJO5yMmw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+9WAn63Fmzs7yhc93ZJp9kLKPG1viCylUr6/UZ+P5qI9UMqtZs
	2aD8Ia1vM7MpDd09pV3+BMgHdR+IiQUjZt9722MPsI01wUycXcTfOH3n
X-Gm-Gg: AZFdTZeMT3J+7CrvqjVoGTlgBUzLbvBG+qjT1cEBnYC2L0S2itN7zQXx3mnITdQO/bh
	ab79BO0XhXutN8OxWkg/LehVjZ4pu2L43SQugScEeOkvh+Upu4p9E7DaLRcptploE4+mD7LmsNY
	ki/I7E30s1st+u2A7mV2dcC9coC0QnV5yuB7iviyHA7RgIu/pciU8zXtLQVAMjkhu1T6FD1oMyk
	3eYn8+hz3OfHqJGk7VmAV2/dS5dGfpAhWBtKwjtiVVYjrEcwNbaSvfcMnY6zoTAD9rgdZ1Bwl6j
	SCI+NMmFa3YNoE+77zocibnVamni0btfcHtMCiUTsdOAzdEPLzPvHf1nZgtJ4gEFQj/YNm1m9z1
	XUFx30J3d333fOCb5H7jMZedZpIc89TK0SyL2exnE/0T0yz073B5ayOWXjj9Vt3tv8apgNOn6ZJ
	mK7GDlXrdoraejSU40qjTVR5IT7rac35htXaT/IAumFE4iIvLRiBFFh5KkuBTPtbHw7QFR7obyz
	3GArP/ntw0eHY3O/BDRSy0GJbcjAC1e2lOUOBjlemhAqAgK3pjINDh8yt81QtMi/QSz0CGenI8Q
	wRrIfv+g4P5xvHffavf2p8VapLZrQ46+RjA+amU=
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr278120335e9.27.1795438669332;
        Mon, 23 Nov 2026 04:57:49 -0800 (PST)
Received: from [192.168.18.21] ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm197171515e9.4.2026.11.23.04.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:57:48 -0800 (PST)
Message-ID: <6d2bb264-c1c6-42be-869b-4548fe697f59@gmail.com>
Date: Mon, 23 Nov 2026 15:57:47 +0300
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kobject: fix use-after-free in tagged uevent broadcast
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
 edumazet@google.com, brauner@kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261122061751.178540-1-omermetekaya0@gmail.com>
 <2026112237-delegate-neon-7b4c@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <2026112237-delegate-neon-7b4c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/26 12:41, Greg KH wrote:

>> Discovered by Sashiko, not triggered, not runtime tested.
> 
> Please test and get a reproducer before attempting such a change.
> 
> thanks,
> 
> greg k-h

Sorry, this is a syzbot KASAN bug that is already triggered, I confused
it with another commit I did. here is the link :
https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0 I will
resend it with properly.
