Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E0B3BD642
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667122; cv=none; b=qL1u+yuY9At31iUffYppQUm54tZ4TuwQeRGOXR4N3M6IBkxUagtxYbIEk09RgdGvahgeaqKJn2IplpHvANY5fMXKnPMgN5ZPq4Rxh8x9B/0+ItLKuglM673mtKMBb9EyBFA6c+1Rqw6XSHBTAhvMDWaPDxVEebtIi7/l+Dh84+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667122; c=relaxed/simple;
	bh=SSEFVYhF2Pg3TbzBC13FrS3vwkfQJZGZ4K20/HU793s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehqrQQ7tNu+M+ELvcqs3ZNMuhFnfRTic83fa3hBh1bW+oEMQ0AZJ7jIJZNrqQGUpvHtdLrF37+AmVPJyJrbOPSiqo4CG+sm/yRrXJoYuTtnQ7jPNLNfuF6QeS/II+KUXjZButYwCE7hsgVemTbrnOOCtd47JvxC41auLJlAxjWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YEF1GnnX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YEF1GnnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783667119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBLtI1cgq6P50LRB2gR35deeL3jow5HhR1wudht4FTI=;
	b=YEF1GnnXoRxftdBKMN9S9hsLuPWtkjaiuXv0RlanHMtFpBBEfHCw8vPdzFnMnNkZXK98IJ
	PV+JrFRMe/k5D4L7eTQoomqIcymjloUn+qysnmL4o/H94kUlMTLC5u5wf6nnaS7t9RuHy2
	TdnWORwCMaqCaH8X+NQgtj9WzoXMkRo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-W_3kr6Y-PQuL2hj9SYXdzg-1; Fri, 10 Jul 2026 03:05:18 -0400
X-MC-Unique: W_3kr6Y-PQuL2hj9SYXdzg-1
X-Mimecast-MFC-AGG-ID: W_3kr6Y-PQuL2hj9SYXdzg_1783667117
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15d4107068so69732866b.1
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 00:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783667117; x=1784271917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBLtI1cgq6P50LRB2gR35deeL3jow5HhR1wudht4FTI=;
        b=SjN8wdDu9VRh4+RuVIvc5CcYiV2eiAJ6MbZ1FClUeNoM6MJKmokwDHfhr3KHdaSl5O
         7RKIpO9pQMlQctPS0ejRBpwrvgf8OO7hn2pgLHwueNjNpmHxz6YV92vGINKYK1nMNRZo
         E2ligATnqpljFECxZqxVWt1wX6L095VIjY0Jb0DzIoWg9jUY4p89jL3d0ENPALT+Sy8p
         VBOVCH455C38b60E7yPW0eE/TupGZ5Fx54fupRW947QjuKqTbtnceRYsvm44Z2GTUXCa
         EhcG5rkqTZpyUt6giCAcYqB/FzuhPoz1ShkM4B0MU9mdhctsIPh+3g6ycN7uHWIfpi9p
         sutA==
X-Forwarded-Encrypted: i=1; AHgh+RofL2cxGuDiL/8Db0cq8Ipsb+pJP9lvOEuDKrSLo1FD+AxG+dXviRR8tHVqWQoiCsEwHR5vm7VByM0OQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqaH0dQqpbTMf8tM4VAiImponNder+haOnGRYLZWmpP4nKMqs2
	0+GQurk2tZrWTNjRbPjxbeJdOQ9+VDN4XI0psDOILkcAto817SVZklyfBA+1cuz1IOtupCVaD3w
	IbNEkerZtzsdmfb3NYxn+Q5Y//9xULVgzRCrx/R006wKxHGCewm51Pyplb2/pFHRogOvLGkzmkY
	AUgjJskBgtr8qpbvNJyzTuW5uOYHbvn6BqgArm8cw=
X-Gm-Gg: AfdE7cnkMNzz7dWU80K0dgBtpVUWmNov0QqPpuGmzkJm+PI9uYlHMWHV92fy2r2XQzL
	yxv7i4r3ygJdWAFWAuOyiTZEoA41TGDx48jD3QRuEPXEqsbVpoY6KJ6FiWBErO2CHOSzWTF6StF
	bZCffKtQAE1YQZOnCgY2GiXEopaVNcWiOdz4TUvS+AxBBluaFdoQDKBCDq74D6KdrSQowRlNCYW
	Cn/SfhD9YtGcRvYSzaYbJzHTA==
X-Received: by 2002:a17:907:e153:b0:c12:b227:c0c8 with SMTP id a640c23a62f3a-c15ce128cecmr304103466b.50.1783667116717;
        Fri, 10 Jul 2026 00:05:16 -0700 (PDT)
X-Received: by 2002:a17:907:e153:b0:c12:b227:c0c8 with SMTP id
 a640c23a62f3a-c15ce128cecmr304102366b.50.1783667116222; Fri, 10 Jul 2026
 00:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709143108.UYeCUUcd@linutronix.de> <2026070922-kilowatt-matador-5e1c@gregkh>
 <20260709152214.rH1O_8SM@linutronix.de> <ak_GDsJS6kVoUM2f@lysander>
In-Reply-To: <ak_GDsJS6kVoUM2f@lysander>
From: Tomas Glozar <tglozar@redhat.com>
Date: Fri, 10 Jul 2026 09:05:04 +0200
X-Gm-Features: AVVi8CeKVQ0uRzsjMytyaivMBV1vQN3ibqcr-YnmwljEDV3qGuwBSJSahwRmcYU
Message-ID: <CAP4=nvQ1GNkD5h9Phr43Usm3pK9xQJT68eOPxoQ3kLMHE0v=Tw@mail.gmail.com>
Subject: Re: [RFC PATCH] sysfs: Add /sys/kernel/realtime entry
To: Clark Williams <williams@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	driver-core@lists.linux.dev, linux-rt-devel@lists.linux.dev, 
	linux-rt-users@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: afK10jel_HuxafC7xekQu54NK_i6Twzh0lPR8mkqFdY_1783667117
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 9. 7. 2026 v 18:03 odes=C3=ADlatel Clark Williams <williams@redhat.=
com> napsal:
>
> > cyclictest (from rt-tests) is using this file but only while collecting
> > system information, nothing else.
> >       https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/tree/s=
rc/lib/rt-utils.c#n528
>
> I'll ask around, but I'm betting RTLA checks for this as well.
>

RLTA doesn't check for a realtime kernel, neither using
/sys/kernel/realtime nor PREEMPT_RT. The only mention of "non-rt" in
the code is a comment saying you will only see softirqs on non-RT.


Tomas

