Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B42DFA4A
	for <driver-core@lists.linux.dev>; Tue, 14 Jul 2026 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054934; cv=none; b=TeDxaWB46NEhNIF18bUbyYoNgrmO/IewJip6RjVgafuS+bB4Ljftk9YUkomO+PQv9H3yWClwrkAQ6E6EGQtro3BJ5Aj2Sg/IyCi3tsd2aTkmrfWUzn78it1bF00quIzBq3bG6J7QibIBrUFOgNdLCrjEd+11Z2CvwL3NZ42+dB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054934; c=relaxed/simple;
	bh=gPFPIei4CDkO7J1lxwRZh0QQzWYIn252zXFk5L8y0Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWM4okqIDSNzNghDyrQ6XMNq2KuBhqRwXP85SWmWHzV7gYDxIrWOeSNlHi7EqKKG6viZz2QmkxO+dwfowxmDaAdz9gbHB1JfYtd+nqFOeMz86Vr0/1MvieEE0RtyHBDSaKartqbrujsbMB3ffrDk6kLjO8D0aolO3rxdUCDpJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dpFzwmdU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dpFzwmdU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47df6a5202bso2882256f8f.0
        for <driver-core@lists.linux.dev>; Tue, 14 Jul 2026 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784054928; x=1784659728; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9g9uFKnNctGU0FYMhigLvskzpkcJ4V8ymJ1XdxHN22E=;
        b=dpFzwmdUQp7qifpv2G+oRiHRFnMMZeEFJfEi2hnQtRmj/k7DRFQpvnaplGChYVWo8V
         /lWQOmEVucONod2/3AQca7BimYN5M57CD3lqyGXthNMWiEmsRBMId9Lha/kXgP15Zemg
         qGNV5WkthHL0WlbLNKySeyQHfHKgHLiG0UYDvQzPgdOowmDVzxRiOZe4HgwuU8kWcEII
         wjuwFs6Eu97ODg1P2FnDeZoC25eIlW2nAq8W4y10snLfdVUenEfXmMTaiJncFUHXKMN7
         u47zU0CWZwZM0IJ/muEnAnyxmHWX8qD19wSB3uPMf/i+1XP8oGk22ubXwoyJvOFbspO6
         LSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784054928; x=1784659728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9g9uFKnNctGU0FYMhigLvskzpkcJ4V8ymJ1XdxHN22E=;
        b=N5omYwz1uz7T0st13fVh9ebbkF3KrFexThnTf/jf9u54Wqecgr1nlm8rNYoT1VZOol
         LVMoiZNb52+3EyYt43mZ1OrWSzhM/cTj5WfFVaxque3LZyy5t/B2pe8m2BM587hK18lk
         hQNgp+I8yy5QORiP2QLmONjS6fnKsAFHqVan338jBwDh3AEXn5TRDYIQS0OlYXYJIb71
         pgcOtcNU4HygKNfw3ofqXv0cDH6+Kbw/sHGbo1X/AhxpzDhRHLhYVHgbPuP8dwU95sXe
         uNLpALlJyiON+wX0R3vtLl64GzMQwYTb2eDyQNdzNjV1y524bGPhCzcXafzjD3h27RPG
         BPHA==
X-Forwarded-Encrypted: i=1; AHgh+RrvUXptH6QhShYuKEKAFvtqbCUTENwRAbW/FIy+Vvs5XyDp7NNG2ddKzVJ3dGyypB1nh95QqGUPltdYrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqOU27VIQxvgdDO0n+pedV02n/KDpm1db/5c+f2IPqsBjySMwM
	MxyintNfZjB7wMKakqzobSb004nVGA26q1nHNHNeMZfHC26F14Ouse6WL3+eELdPjnQ=
X-Gm-Gg: AfdE7cl2J1AW+/1FJKVhE5fxtkmEA9O34EUCj+HInrtuq/o7CABEG/NafqIQ0cwedGj
	NzTEXgDs6qzQwNNk7NAaOxX9qcpNQVAZ7l7WfZ2X8EGa597uATqTW8U+3uWKGJM3WVt1FSwN1hL
	Nar0e90s1h0tx20n/z9HXmRTwCSPJiYZLnCyCCSU+EFXzH8+XBuZHVbkd3FTNxxpgIkgXEjaD+e
	rj/288PgUsJu/bSP5brIZ7ujYIEhaIUaOvdNmB0femXxZvqwqf9G2uHCZCDtpqAZjL5EWUumsaK
	JNJjgC8dDDIC/57Rr8weXhBpeY7dpIWgDcTDeRlVgRxuTMvbMrmVJqnlqokW/HXYGKV+UQ39Mf9
	+SYJ+r1FARYbDxL6B49WrtUid+05/G48S7Cap+adhBpKytEMKZOJbyVQ5r6GynjGlmbCvf5gPMJ
	iQAnVs5XRfNZFa+T5KG8xh1wNWqIMNYbOMzvm+yj0AHHMC62CYsvDB3rk=
X-Received: by 2002:a05:6000:3c6:b0:47d:f023:b4b3 with SMTP id ffacd0b85a97d-47f2dce9728mr18256050f8f.34.1784054928423;
        Tue, 14 Jul 2026 11:48:48 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c4320sm9826293f8f.32.2026.07.14.11.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 11:48:48 -0700 (PDT)
Message-ID: <018687f9-a7ba-4e30-bb3c-25ea6b8f172b@suse.com>
Date: Tue, 14 Jul 2026 20:48:46 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
To: Danilo Krummrich <dakr@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, Colin Braun <colinbrauncl@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.07.26 19:53, Danilo Krummrich wrote:

> Many APIs rely on this, as in they only guarantee valid behavior when called
> from a scope where the device is guaranteed to be bound to a driver, or IOW
> where a driver can prove that it actually operates the device.
> 
> Drivers must only acquire device resources when they are actually bound to the
> corresponding device, and must hand them back before the device is unbound. The
> devres API, for instance, exists for this fundamental reason.
> 
> For instance, we can't have drivers manage IRQs, mess with I/O memory, program
> IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not bound
> to and hence are not allowed to operate (anymore).
> 
> Those device resources all have a lifetime that is tied to the lifetime of the
> device being bound to a driver.

Understood. Unfortunately this does not map straightforwardly to the USB API.
Usbcore tells a driver via corresponding opeations when IO has to cease
(and other operations should be performed) and when it is allowed again.

Being probed and unbound is merely one of them. Nor does this really
tell you anything about the device driver.

	Regards
		Oliver

