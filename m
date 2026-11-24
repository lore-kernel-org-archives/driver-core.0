Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505388;
	b=OODCwVgYgNKJ4mrQvVJqv4nmpdQ7ZfLw62gHbSXgnEMzmKE4DHLHIRKjjfpv49dqNN3g
	 5VDyExmVT0KAko7rD3kLF2sf5i2VgUK1i0qxXm5IEvZs3/TAtHQbSRXG99DxmNPtB2TdW
	 fjTGMaoUgT0R5BqjcHAYKHLOmh2D8r6j9L1jGe3Aa5XWuNFwvNFuBuXP7yxAhoC/mgNUh
	 vnwLi9fXKUT3puMk5W84Vg7sM4p/RBQ3M6A97xCo8bE52VPbNRIpxCJ0B5BdSHebx0my5
	 6C0FSYlDM3KSNfLfxwvxQ0VzYFsjqhJmjO94RWt0vPsh9GDKEUaYWfQcDMMU4ecSn9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HHoAin8im1fnI2MFH3oWDJgzqw5jsSnp9Q8nmC/cZc0=;
	b=5lS0/dbs2ZR1WP26952lsDYDnMJgbOnKn1WOxBX3UkenOYD7+x2bAuDppY6++3N76Sw/
	 w04xO+YyTfqX6+VO2fm8BF9Gdu9nN2yus/fJ8M31G23vW3+amt6GSGkFeiWNXO/zVg2hV
	 ZRNMJmo+s4HdpuEYuNOGiRx9SARreNbqaxJW4J6RIeHGWVkYDDDJH1K7QTaJlrKdaMyG7
	 4Vau4ElM79IeoyVYO2MFWvJbF8QBoNxVktDfPoNbYGwSOInODOhSM6xmwzqsavwNYDxjv
	 HQ/LKMDlabBVQyvAQguw52Oc+DcfdbeqMij4sSGbdde3KB2K+DtzD9orrqgeIsBTRcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM932N7U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC611606A322
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 07:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC611606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM932N7U
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso6109984e87.3
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 23:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505386; cv=none;
        d=google.com; s=arc-20260327;
        b=EYD59lP1H99wqXjDwy3UavXMga3jqL7MsibyiIdwpVfr7XPAU/S8wYSvAUfwQQTa00
         4nAW1ZOVYQUbOzQQsYYpRgMWrGfjsVSD8KnMuqNaSHz5HU/HnvF84zDqQTa9CFHKZ/31
         3BogVQAC3EH7xJbkNIFVN7CbqRhgL0Iu1BfcejjJUXeKe/wW4kZS2/qDlYzhPJ7j+0MY
         3eFbo6kFDSd9XZ1XH0prEUh7iRwAkycLNt0XdSUcHbeVkiAMHQt7rz+2IdmOpGp135gx
         iK0NN2CCJLh4lyGf22DyxJl8dSebJtu+84L6rm1n5btwEjCSSclfjxAF1hhJNWahEDzU
         k8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HHoAin8im1fnI2MFH3oWDJgzqw5jsSnp9Q8nmC/cZc0=;
        fh=cRH3IcjyW+CGjUufV/LNVyp0JL73a+zzwgqPZArwPQY=;
        b=IJ4fFlb88wTa/I5vgU4FjGLqf9JafprCoUYGMy0ZLn50Ni/YBgvDNDGeknWtN/pBKp
         laGmxLcq+3HuJUJXSMzEAFcD9sIOS1s2VI/Hhnvs4al3vnUlWKceGqL9QffAaWGIxzCZ
         89dbgoHUax1lZCaVzwVHV9reJ+fXe9acWeyLZ+n0/0vqckKonqJD1JfPz7t9Sam8mKVc
         4gLA5Wkz1xAUyjXgK8v/0IUnyGdeMt2it3AG/D7w/ZKe5mAyXZ+sO4qoNlt44kZLpcy/
         OsUYdLdc03qzBO+bN/i5VgkiErtl689B9S0UIFQrrwxmqZnbqhbpcjHqY9cmaKn0POFN
         PzsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505386; x=1796110186; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHoAin8im1fnI2MFH3oWDJgzqw5jsSnp9Q8nmC/cZc0=;
        b=GM932N7UcS3JOUsHmH4h1wUOyWUbNyhOj3xMlucOV4VHG0qgEJ4QX2oCmgE3iyQSUW
         0GsUORLNNUole5hsAVXyzYyYC6E4jsSw/K7lavDdHi3aANLHbbZ2SkRFlVzJVZ6RDoC9
         7Kotna65IfbNPQRjOZEv27kaHL6XDLxAAiOsN9UqTFWEmqFC/HNTfQRrazUTI4BzBRUG
         8+ga5RZEtflSvEC5pJRixTqQFwsyeSl6VPtVXGBGpj+MtaF6zZoFImqvrbs0qAl/B3Vl
         e0YQtGocfb9/fAI/ejHyG6kqY2go6a7OzeTUD0XhKIZkDHUHtid6d24AT7KPGKfCXv1X
         ukNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505386; x=1796110186;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HHoAin8im1fnI2MFH3oWDJgzqw5jsSnp9Q8nmC/cZc0=;
        b=jids1gK18w4h/rJROarvLr7paKQjg7QBTMp55OrF5+iPehWLBngaWhjE99yire50W/
         AwWNONjFcEXXo90hoUc9ZNJqwj7gvdV77C6X1c/wqQTHTVk8PoyS++GwsStrMa80Kplr
         sUHkf/CHhmaTuBGqCcHYqQhAxLkI6WlCdjwH47TwhTObKsgSoBteqkPWj8SyplW2t2aF
         DxWHIeVkUJ2zMgVdi1NffIJe4Of2UhpRmNuFaWM1W+jZvKF3eXAtdHPa7f22D/4N3wtH
         GlPdX5Mt4Qrv/k+SjTWOscqP/tYe8+H20KVTRp6Yp09V7GPiYbM8ZSUZAiMDZd6JtWf4
         q6cg==
X-Forwarded-Encrypted: i=1; AL+hErE2ANNejJ6VLvTo9fvdQLN1xbeFC/NwTZ32J2rsI5ScNSt+woUdSvCN6EKK2cl4j95LfF7iVjGhFOF1bg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ufCJ66H8YQBmePbrJSDDTBxtN7nToT8IXB624oYGesk2vF+FZ
	CCxJiUb0lSp/oiiv9mPHBfU8HOYZ7JwXNovE3ItdFQtwEeXvMMOBtITsDb8rNEkpnHaWkYN0AKC
	xSJsTBRiliFIQTm4h5eCx9Cm0RckBWHI=
X-Gm-Gg: AZFdTZeC4AaW6OLuDc4QMo2SpMtfnrP2ghg5dKQX+aye2FnswNObnTiCcwQw4QDZg9r
	MYY0mMARTX20rcu5I5zVKEAQ/MrDAFafUSBxqF8Ka3e7gonjLHUSotjE3bg0ELWuXT2n2SLaB+o
	VGLQ0R5zML/xXGGl9gIyUMGSAqiZWOIruacznvtHOZdZ3vjPQ13eP7KUexo6Q1HgD4MrxKaJs4i
	Eu8tAWCvjDMjM40j7iCvNFzqj2dnsMhOrDl38vSq86mSO3P1sVRDKTYju7rXuY01/71XjaOrw5x
	gin9WG5xuCwwAhhtfUNDGeEUVQQjt2mxeP6qlHbUepb4ZnDnLIjoHa27KVbYvqmOTqOMDvva6Xw
	BQBJGi2RHXaNrRG9WeAJQ17K0GtWi7ql22WE=
X-Received: by 2002:a05:6512:3087:b0:5bf:e540:8606 with SMTP id
 2adb3069b0e04-5c1bc898e67mr4261475e87.59.1795505385842; Mon, 23 Nov 2026
 23:29:45 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117-regmap-kunit-val-bits-v1-1-a1cd02063217@gmail.com>
 <av1qOFxolvDhQTKs@ashevche-desk.local> <a93f6d11-22a2-42db-81d8-297240c9bd2d@sirena.org.uk>
In-Reply-To: <a93f6d11-22a2-42db-81d8-297240c9bd2d@sirena.org.uk>
From: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
Date: Tue, 24 Nov 2026 07:29:34 +0000
X-Gm-Features: Aa3M54ph22eAMFVDyRykrIGrEABI6AhQfgi6d7a7zVpyiMmcsmVRWIA2hsRMJvI
Message-ID: <CAJsKa+4KEU8ejsDvj0=qCh3=XC5dZZNv_X+Saco4Ln3Y9q9dOg@mail.gmail.com>
Subject: Re: [PATCH RFC] regmap: kunit: add tests for values wider than val_bits
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 11:30, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Nov 18, 2026 at 11:04:56AM +0200, Andy Shevchenko wrote:

> > Do we really need those explicit castings? I think they are already inside
> > the byteorder macros. Also we have be16_to_cpup() and le16_to_cpup() which
> > might help.

> If we do need the casts that probably indicates a problem.

Yes, the buffer was declared as u16 * while it holds __be16/__le16
data. I will use be16_to_cpup()/le16_to_cpup() on a void pointer in v2,
which needs no casts.

On the main question, Andy wrote:

> It means we can't enable this test cases without addressing the underneath
> implementation(s) of the regmap. I think the proper solution is to cut upper
> bits on the regmap level, so the cache and HW will see it as expected.

Mark, would you be ok with masking in the core? I would mask val at the
start of _regmap_write(), before the cache is updated, so that the cache
and the bus see the same value, and document it for regmap_write().

Some regmaps leave val_bits at 0 (e.g. ad4130, ad4170-4 and
phy-cadence-sierra), so masking has to be skipped for those. The
reg_update_bits() and reg_noinc_write() callbacks do not go through
_regmap_write(), so I would check them separately.

The alternative is to reject such values with -EINVAL for all buses, but
that could break drivers that currently rely on the formatters dropping
the upper bits.

If masking is fine, v2 will be a series with the regmap change first and
the tests after it, so that they pass.

Best regards,
Raffaele
