Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397182;
	b=hBvkMP0EXlDsgB1XLZbiUfiFNJlqXPUuSo4b6Q0swhPzMnQ02qUsUKMpyBTujMaIKM38
	 Yg2sA/gZu2dWI+ghTT4iNCxmAvgj/Idxf405N5bSSkDAP+Iqql2AErsGbLa1zGPa3zVBc
	 wZcfCnp98IZl33jsV9kd+IA293DDmzOcCmNfimVLPwkWPvECfPq6AygBINE6jmK25Bklj
	 JGJm4P8W4IbzzZ4N0iEbRR9UlF4Qfo98yI0grfrt13/Gynbuzyoi9EGYexh5tz4OHkXKz
	 mdh2aLR6cyb+gPqiW6WCgYBGZMy0F3pYj6WXr/HJNRr59FwJjET2f+mdnKsiZIhq5wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=xbce5/VFlKnYd3/rEVwtGbBP5JyQRMDjlXIwX2G3An8=;
	b=XYRWV4ZMR0O0ANHkFmGn88ajRpQiXDVQ56SEL7kwCcaLSa3mr3pc+eqoo7So6TQZlw/a
	 4rqSCMAI9JF7Z2whzi+68vUJrk5t/b0A3dfrrgWmUwza+YMlPgm+wHdSQpk7tossmLZ4k
	 zq4HeOnczGsgf907pO7CnD/9L51kAtEaBpQiD6/hHagTn/AcfwJp4tzYI9Pni2QCf3kND
	 DSZP19gSn9hvn9LLxYxr2P7ElNOv2YGqbel75I4a0d4dtf8Uyu59LyBRK8f4h9H+COHZF
	 y9tv2For9QjZoVFMl4/RamWiJFGutopMD1JyiFb8UtoWCpN8/aleilgZJ8en0asI3kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9SHyBie;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A4606A31A
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 01:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9SHyBie
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38692f62b22so987058eec.0
        for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 17:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795397181; x=1796001981; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbce5/VFlKnYd3/rEVwtGbBP5JyQRMDjlXIwX2G3An8=;
        b=T9SHyBie9YliWumM6CoGOlzmitPQ2B0Ccf/i76/GjUlzuTNMFRV/7af/8tBYLhea/k
         u0emeuAI87yLErCsXQHX+F/tHXBSfQ1QhWUVlB0Ucqn1nAVldb7u7wRhgzF1wALF5Iim
         9cvVtU/cToVqMdUjRyoYN2SNKtK1O10JM8msMfQzH7YMwziyJHpE4ENPYGgGo6FcOLPM
         rWKwUhOKR0C62034SeLiWctCasdcVQyFDotApAWg/Hp8QPqOF6WktESb1+AH6zN6YXPY
         9ya4KYG6EcuFnI+aXOkHk7IzIpYQOPE2YH7PW4qWFZ8T8D0F80K6HmH/PoY7LY1WV9Ys
         WxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795397181; x=1796001981;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xbce5/VFlKnYd3/rEVwtGbBP5JyQRMDjlXIwX2G3An8=;
        b=tIvJHtYSZyN/Vn7ZrvdS2xZCoiJzKCuZSC3mDCItCw3eTkGeD3HD8KoGYwBTFygSc4
         3dINo0FyOISQ1t7VYC2iImxthS6WgIRz3FXSoiJsNOErkXtjLsOM4P2Gp4Ng4r1p+peC
         Bjyzatnh5htj9LEKY6Q621l0Ndb9vItUTItz2msGgloWvuDzanmvsVdmWL7x9rQg6iXU
         hafpfFdS6AGuscBNZWGhJoG+CpH8SO9Zar6XGH5tOOcIy41BgY98t5pFbA6+6t/JZ8lF
         xAxTKT02OeNVxl78HUuXgwHjV3v6koGEqSFqd/Z2XyhSYv1Xens1P297rD3Gh2cek36s
         n2Ag==
X-Forwarded-Encrypted: i=1; AL+hErH/4Lwvo6Xygg8JK7FjCp1EJvce31N2LQ9EfIADcsTi1ajsbIIeZeUCtCoF/CjqP8YJW0EdJ2UhQv6DEw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8XlYYq0k/BIYLJH9p68W0uAx3uM3hhcomup8Ec8TOJjlXCZJEq
	gkFoUTcmEjzVAMl8yJnBXDJHAfCTqTisqUTFeQpvVE/7mO0sNJkZieks
X-Gm-Gg: AZFdTZeSo5HctpvJ0YX2hRL9NyqFmlEFAcgm+BRuuGmwCnUaQ7waNg0MAEJHDsCku/3
	cN1qbqDYD/uah5N10P4YfEoAyS2741dSfkObGwRgBPUxLZM6I/Kk6IkfF7jHNBHb481rgsk7CPq
	iSy1YsCU3nf95o/PXlmT2mJuwiOzwaUhIAXuFQtEB4FsxRQnmJ3GyEmFr/ovyQLSsde1TEAkCyh
	NxkOSJ3vGV4IelgW92wJuKVQYJmiETKX3359grLWmTVQnXraENskqWUVpfZBqYfkcMgA6eNsx2I
	+zRv/ZiGSZgRHfByJnj/tIk/+kwwWxMFrl+8i1BNRQmp88ZKqpUbC9vb8kuGsRbUNm+x7HBwuV2
	0TrgPXSt8WC12JAlMN61gwIbrrAHNkwdndv9ot+ICKMxSz5yKuf4JODwGPPLm7jypHJGmzZKazx
	2C/UqLWLtNPxsLJcL0YGWTN5ohdfH6IwdOiz/5wavhda4yTWauC5/gEN3uy2xbQUzEaFzy9eZu1
	BAEerRrVqloDlg5UBjEr95oC+SqoY2w+9Lr/AD6PreRpXfDJadKnGnKyvv6+DQloBVSt19VUrZL
	rkdIGDH5VYLckTkDe0kpEaTUTqLmtNBe+1fG6a+eV6OKzdMd4pg29/yjcR7Om+TD7c9MKnMnf45
	h0TEjCQfaY2UBeHE=
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr1516118eec.40.1795397181291;
        Sun, 22 Nov 2026 17:26:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm32297247eec.6.2026.11.22.17.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:26:20 -0800 (PST)
Date: Sun, 22 Nov 2026 17:26:19 -0800
Message-ID: <56aba0ed09b774b822028d773c03c4c6@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: fix race between bus_remove_driver() and dev_driver_uevent()
In-Reply-To: <DMMWDTG48CAN.LHRVFXXDY5YV@kernel.org>
References: <as71DkwHeLGNDsPv@google.com> <2026101444-unnoticed-caliber-21d5@gregkh> <as8dAu4R99pP1GHD@google.com> <2026101409-unkind-ablaze-08a3@gregkh> <21f4cbf39c7872893f8f2d3bfde7d829@gmail.com> <DMMWDTG48CAN.LHRVFXXDY5YV@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Danilo,

On Thu, Nov 05, 2026 at 02:48:33AM +0100, Danilo Krummrich wrote:
> On Thu Nov 5, 2026 at 2:21 AM CET, Dmitry Torokhov wrote:
> > Just a gentle ping on this patch. Could it be picked up, or would you
> > prefer a plain spin_lock()/spin_unlock() pair instead of the empty
> > scoped_guard() block?
>
> Personally I like the scoped_guard(), but to me either is fine.
>
> But I'd consider updating the comment above dev_driver_uevent() accordingly,

Sounds good, I sent out v2 with the updated comment.

Thanks.

-- 
Dmitry
