Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793674800;
	b=1QUgayNdrO84RuuJSzmAYaBETh4C8s2D1OSao9DFr/kyI7uqSx3Qa9W63OFhUDthEOgs
	 QqL3LHljaRnpu1y98DMdDtkTKtmbOpa2E8gIZ6djqfd5kdK+bE/LBMyWj13R9Ltn7goeu
	 VVzsYJsT5AScRzzQOQD5zoRgPXwKsML+3mjGl1ZvT/Nfgu2kqIdu0ghs4s/0OiT95PNB6
	 9+mBF8SfSbsOwxO06DHBW4qnX3jGe6RplvFJIwEXXzG1yNmL3fgyK6USYVyeTXBWh8kJg
	 ePzHUjEI3wqisXLah3RdAZ5HzBQd5wlNYjTl9l/uyFL+SuCjfw2ovhg5daX60ob19JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
	b=evmL95egBphxo5U3Rgru7/1JX+oU3P5D8FdeZdi0RIGh4of13g1Hq8mPOixA7nMopvaE
	 nPIWHrqD6MgZmVnGOj/yq7Ylz82DK38uBzHl4jI561flsD6pxVQU+n6Q/tfMxDcFHqDfL
	 H/4V7D8FVW3fLkC/cEgSQgZqzeQD10SSZr/G4dNQBP8Vqb4vAl7aPFLFXem+vmW3UbSJQ
	 237DD9GOct98Cw+gQrB/fD3XJa6J/g0C9/FsOMUkDnYmAk4UOl3c8JqJ+snLvuS9lLQqS
	 DXOJN/OPa2L6P7p+u8/lnB0Zqcbi7/he2NpHyem839EvZ9lqYdeqyEnPUsBOD2RuURA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnHbJ7SN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1FB606A326
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 02:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnHbJ7SN
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so2612121fa.1
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 18:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793674798; cv=none;
        d=google.com; s=arc-20260327;
        b=dU0EG0wmYCc84iyeV5F8CJjvRceUShMVKYHaB1QPTG38MF4mwv4XLQQMmW81oy/NF8
         aFXCBp3SNaeV+ezio+do8lIfFHeqRK4QybrlGawNYl3u5trxqZG51+0qk/kcMR5FeaSF
         2mD6D2kEy9i2Cdjm60iO4wXCRj7tHy7E+3xqeB6BpCthhSxNe+qmPivOIbnFiQ4qr5wQ
         rgJseoZEalnCHCd0IrhExtNqHjuV63Eu4qcTy/eWlMbNXvZ611YvFBGDY/2yslvNwBJh
         vw4+C9wrP6rQ3khl+XnOyVfuapfRJ+DBI/vGkExHN7sUE5hghbttSWgCOg+kYZLdhCHN
         OkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        fh=B/j90U+VSZgiMgR7rhCV55/1T/94IsB5gAaXQIh+RQU=;
        b=FqL/8XZ7bKSgey1443Z9AjOl75y/W+9xZTGFOO1jOByuJXMNHC6kRRw9G4Kv3LU9eq
         nk/RAeo+PdNiXuD/Ox30e0hXK8GCX3HLIqdaziLc2gWYm7YDig9LjKwGKMTrGr3Fiedb
         /Rn0qnGgY7E5wY50TnAGdRjMJ6OlflZ0LfxjiJolocfD6Yuo6mNO7EiAtXTDzRpiD1Qg
         ATNTNIHOWU47eNaWAzggLKGQazR2d9giigvO2BYP2N6Yd3YSfHmjPz/H7wSQibqMSWdb
         kWSO3UmKTCPqpB5ONV3HXDun/sgoYZcyx17hopGPbH0glW5HXwkrBDyyZgZK/6EfY3FQ
         kMkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674798; x=1794279598; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        b=AnHbJ7SNGliwuI8QYVvoDmu7ORXT7NRItZFRasV2YUiS1f7B1JovDeoirNu1s8Q6aO
         Hz+rFFWGZx51JP2U6h69zQ9cACN8+/QjroYn+tUM+sWobHg2jZHrbVg8NF0wt51xagPS
         /3WEveR/hf8tukMQ1F8G9XB8albnmbmf83+O4iTJ1AtTsgSUFI5Jdbb7sMQ+bGKeY5kt
         iYaPhT6nXqfjyIvj2mq0olrEkpD2BqaYsdDSbOWjzRS4vA/Z/5S4dtAnuyqFW9Ea2U5q
         90MBmj9Md8UW/T6nZG8gNOM6MeXN8awGcyKWuHx+igERxd4YMD+P8imALiEHIGIHGRmp
         sZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674798; x=1794279598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        b=xXZacPapCqWWAK3gzDt12cBLi6OGmmyHN/seTl/JuHZ6XPhdNBJQkDxc3fTn8/6ACX
         ZIONkjICzN85j2uBHju6Alj1mkZfGbFQpVdDopF7cr1iNP68RIWkQpW+CcPV+Oahn5g5
         w/jbKf97j/LhoyYYwqyumCtPlzIlg3tOR1FVp3ILJRSdVfl+NK2LeAMdwWnoqNFk7deI
         svJLMY6ajH7276KSxYcvwsGdjbJkuOj3sKtZ4B9FpbjFvnMFT4q8elArFBUOTO5Vi+lN
         f4UonxyewOOayssTE/XB1CMsP24EgpEcExQoBJrHxRA4aEzx702EG2HDlINRu6mK7hgi
         LWuA==
X-Forwarded-Encrypted: i=1; AKwUvBzJr8qnzY/ZdKXoak22wrFJs/hweZjNP042eL0N6VlX2jdqMr3ck4GUzFroJK3TFXra8jlt/ifVBvUDmQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/QFLwJ4qSaB+pQkuqBWGsXrLnoCZG+Av4cM2pYhI5KUZHkUawU
	4jA8wN4yZAENUVjC7iEIhWp3N0kW9bHX70JnsvNCSIIHHfvVFPy3LwpjuxSDGYxeJdUL0QK0e2c
	2In7cSok62fbJGOOwvp//4xOsHVnCfN9WIyy7VhU=
X-Gm-Gg: AYBFou0GnQqS5If1/VDGwgaiWkEMeA4ErtLLP8DUG0MVu5Eu+Mb/ycT77xzZzZbFpLP
	MrcaSPPSVmdHYcPCObAq08E6s1iMgMuj04cNR98uhMES/PeDxRMLjj4VBiuWRmFLsnXSROYtx20
	xVyMrQB6Iu/gBFUSG+8MP1kPeT+RtQPCqlOCDiRXUUzS1koIgskJHAaB8lbiK6x49aPpiLzjQh8
	NAIvGPwbBgLSh4z/97UWW1z3TqcvT9Zr55FPOfgpzedtMmAxnB4H9LjuXSxjxr3qrAAt/KoYErq
	RGsU1ZDTDEcXLO/aBong7s5O2rLLbOJzP+7srHYKwM9nCuHHrPVuaUtxWE6yeDlLq3eztVPJwWp
	wen0IlvDUY93SSDfsPdaS+9SaaYRisNlZG+TQQjw=
X-Received: by 2002:a05:651c:890:b0:3ac:4f4c:8da2 with SMTP id
 38308e7fff4ca-3aca5812ademr34312701fa.17.1793674797546; Mon, 02 Nov 2026
 18:59:57 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
 <179260197668.3127.18219777718091081046@linux.dev> <CAO26r3QK+Q5=JR5TeMzEX-WiLpgYWd8Zn0O1qx11LxTgN96BPg@mail.gmail.com>
 <179286358623.55649.5397316745104390556@linux.dev> <CAO26r3Qk3bEUwL1=MyHP6hu_YQNSN-uD_2-ceA0KtK=ejxLf2g@mail.gmail.com>
In-Reply-To: <CAO26r3Qk3bEUwL1=MyHP6hu_YQNSN-uD_2-ceA0KtK=ejxLf2g@mail.gmail.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Tue, 3 Nov 2026 09:59:46 +0700
X-Gm-Features: AclHuK89EtRkVz-OsObyYnxQUnt0Uu1dpICeA0ah4MC2QsH7LZxgTCAmcbRUiEw
Message-ID: <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Igor,

I've tested your changes on an AS5600 connected to a BeagleBone Black
over I2C2. Everything works. I'll put the details in the v7 cover
letter.

One thing I forgot to ask before, the registration rework in the IIO
abstraction and the driver is your code. Are you fine with me adding

  Co-developed-by: Igor Korotin <igor.korotin@linux.dev>
  Signed-off-by: Igor Korotin <igor.korotin@linux.dev>

to patches 3 and 4 in v7? I don't want to add your Signed-off-by without
asking.

I will send v7 shortly.

Thanks,
Coirul
