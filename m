Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5FF28000F
	for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 06:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774160651; cv=none; b=KIBT4r3/7c9oHQcaKkbiEqe8EvxOkUI9onYBR5sRb2AWDmExHeHJa7r8mbz5M3OE7BuA2UcaNrpdJk5jrtuwQGBG8dTM47mzAjjFZkp5ZncduSgDUV7m9BITCLhdQLxHRH9dW19wW2reECpJrc7ZsrvKD0oBLHBhTVMSL09boa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774160651; c=relaxed/simple;
	bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ETJ1ozRB2M2c9IBjQfNb11hr1ZUjy0meBT6IUySzRoicw/qUrb8cpwb+lcLP5yuhPGrRholhHSjFT4LBuzcSkhjz57vTDBtewB54ZzKEx5EuX4LC5On1UI9RFZt/viVPsvlxPkj7BSeq5x5Se5BQo0ii8NizdiCeA3O94kP3TSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKdd/bgf; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKdd/bgf"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c107ef474fso3115750eec.0
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774160650; x=1774765450; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
        b=aKdd/bgfctwLQ0Imgx11RKjqcddY8F+x1f76Acphsv8zorCkj2EdQgb8QYDr9O2oD/
         AtcUXQG8Ry4/+RRvWLeL4kzYraQ6z1wBmL8iadKOsHMDO/CQWQhEoKNVqW1DdF0d44fA
         9faMPuxUtrxpoACP3KxPOB+hSfiGd3xOsYPay+BJKYgC2ObLt5pc/WNrnE1nbgjPVXAu
         sx/N6d/GhmHcSlHggcklWr44Yf6WcrF6xfGfm0CTZX6vC/P1pxO+/UPoX+yHioq5ZZZg
         +o0CSkBK+tclRQJWSmAvKhHth9oQxJNNpy2JyJlcwv8cswHH0zKuDWLL1CRXLNF0WxxI
         /U+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774160650; x=1774765450;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
        b=puh6jRyIUEH8ef0LPCEXOe27O9C8meCL7tQj8Dd5X8noXt5qJRxjk88zHuE1Yjf4/Z
         w7yzwblGZl/TsUyIB0cS+mNAp5l+7UJ3wZvu5VyZ5mg0q/v5bROwDlaSq+ECGt1lTRQb
         qyqNVnA8taxmoCqsN7x94miJrr08rh9MBuTO1vasST166LFjzFt90Hi8E0iTrUIr36r3
         kCjhKJlViAA2hFreCx34byjxacjXeJoSH/5rbB/gCTBms9wwWBZcDAXY3+LmpSDRTmFS
         FX7wHYpU9SZ75qEMMproFee7VTITu7lPDJEyi5aeGuYnSinSS6qW7G7Q+/CX8q5ND7Ii
         1ZQg==
X-Gm-Message-State: AOJu0YxEnxqIEYj6Xj5ESYbKEqFw/awsakjZFKprKGwxdduwSYahYsqf
	x0EmALBqLGWnZLFanJBqrAbwC9Rj2NU74Wf9Bp7VS4/+xS7VqxgXoh5d
X-Gm-Gg: ATEYQzyQyNOCdRJnI2BzYJXYG/OxawYrUkCfSDxdNEEH4qLr4LWsIt3j0gO2mMGDDCo
	w1SJXPdbC/8DhyCjf+uVT/mjjQpVVnbylPze8rm8Ga1NBXMVh06CeyLIjM5CMIAzDx4ArGY7Dz5
	VMpQejUJz8LFXEmMHNxIlqWdGXqocgjigG9dgb3jH+YYOyVL086FwHJ+dO+G1Q4BT9HMVLwc5W7
	l9qOqKQh6UVceNoqT8YfwBpzO6KX2hmzwBTGl20TSKANxCFS3u0enaNb42eE/ULV8BV4ILkhDKe
	0rFoxYnVEaXZrGUGyGRxhF2+imws8++rnYvXlC2TbmU7XXvJYV6kKMWPdOWqGRBQki/aBmqRGzt
	Imns3//7nROXD8LCN6Tx0m4R8kjN/kOSREqFjBOSGBCSoWh901y9OQQHmheuU9q3Eoe1TGLF2DX
	w7lq+FL/kCsDFvA625ZgBdF7zETj3rx5+808ak6O6RmioA
X-Received: by 2002:a05:7300:e785:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2c1095d7861mr4599770eec.1.1774160649552;
        Sat, 21 Mar 2026 23:24:09 -0700 (PDT)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm9235890eec.29.2026.03.21.23.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 23:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 23:24:05 -0700
Message-Id: <DH93GL0U3NZO.3STS474THERXH@gmail.com>
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <aliceryhl@google.com>, <acourbot@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/8] rust: dma: add generalized container for types
 other than slices
X-Mailer: aerc 0.21.0
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-3-dakr@kernel.org>
 <DH8UHISTLOA4.934370PUTLB4@gmail.com>
 <DH8WATAVCH33.19JPYBAOILCZE@garyguo.net>
In-Reply-To: <DH8WATAVCH33.19JPYBAOILCZE@garyguo.net>

On Sat Mar 21, 2026 at 5:47 PM PDT, Gary Guo wrote:
> They're going to be removed later, see https://lore.kernel.org/rust-for-l=
inux/DH87CCNRR5EC.2SK3IT6N6Q8V5@nvidia.com/T/#m30142b65bb87af64860838565c78=
4c304e02b563
Got it ! Patch LGTM !
