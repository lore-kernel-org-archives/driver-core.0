Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601985;
	b=P8p3rygFar1dbbNJlhd7fTSEzLzvNN7iDD5/U11yP+PNI/o5DZDjBHK/PZL65ewLiBlX
	 /wqovlbEl6iOawC5kPzRIQwpwbbWigAFxy3PW7UaL5Rlx1XYryCBKDpzn6iP3M8pC+Niq
	 XXY59sT/Zzrzz7py97VOSblhIm1OKA8nm/cPUfZtjC8TKeOLI+ngOhAuTTE5R49cdAnwU
	 1bxMu6OwP01JiLaAGcP+KUTlfCnlaYkR0z0qzv3X+W2BsnyKLUtoLCE8+eI5bcvbDbxlO
	 sA2ybc4p9VGxxmtqWdtFbMnc2uVS/bGaHrP0ZW5dfGyZVEl135wBHV47QcoRC4uJ25Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601985;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=p+CU0uLPlyx2SCbGFn0tLzOAhUz48rH3EvqMuFceNuw=;
	b=Vl/1mjx2ZvAUdBXOZzZMJx76jhPy+TuSV7FO3P7TU/YMDaV5iI3RLYjI81zJEJxg6s58
	 WqQX1r1F7hejEuxRvYH5j9kGHznNryUgs+FRcSMYEccuSrjQ4qUY47GYEYrpaaxdtJfF9
	 6VMu0NpdxJreKtFE8Zuwwgzq7qxFDVDayb1ISX4VZvRpXVGlCELMrsVaIIbYqSW/Z/V78
	 wHhvlqLcy/jb+lk4d6TIRflSoIVhnNDlkkGBlY8mual2SpbRi3zawBB/+69N2/X9ukhh5
	 6M2rcAf+Ptf8jaVHBswTrk1TqzPiU8tUMhgJW96QIh3rr0tyfJOp71ToiYJBJ9kbRyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.72
Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548D606A32A
	for <driver-core@lists.linux.dev>; Wed, 21 Oct 2026 16:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6548D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=N2OoIaXbm1ikGvwpS1JJSDFdorhSOcRL/wya42gaR/o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792601977; v=1; x=1793206777;
 b=WqohzBuXMER1LmjiCeUCqqT3n8lklluRkRPsxMIjlU1bosfcFkiH5w/GJGYfTwMS7MRRniwW
 R64eJpT1uOdaQPteFt49LBqyJyKoAX/7hmh1cq1dAiDDzX72NdvsXJG/M9S07K6GTAojBCM6oBe
 xJRmKI4T+lMdZXoUDKMiFCzs=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id de2331398842e179;
	Wed, 21 Oct 2026 16:59:37 +0000
X-Mizu-Trace-ID: de2331398842e179
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>,
 Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org,
 linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
Date: Wed, 21 Oct 2026 17:59:36 +0100
Message-ID: <179260197668.3127.18219777718091081046@linux.dev>
In-Reply-To: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Muchamad,

Reviewed the lifetime/teardown contracts you asked about. read_raw() has
a problem: it takes parent: &Device<Bound> and recovers &I2cClient<Bound>
via TryFrom. That conversion just got removed upstream ("rust: i2c:
remove TryFrom<&Device> implementation for &I2cClient", use-after-free,
unrelated thread), so this won't compile anymore. More importantly, Gary
Guo made the point that needing the conversion at all is the actual
design issue: a class device shouldn't reach back into a generic parent
reference during a callback -- whatever bus-specific resource it needs
should be captured once, at registration time, and handed back via its
own private data.

Concretely, this means dropping devres and letting Data<'bound> carry a
borrowed reference directly, which it's designed for
(Driver::Data<'bound>: Send + 'bound):

  pub struct As5600Priv<'a> {
      client: &'a I2cClient<Bound>,
      #[pin]
      io_lock: Mutex<()>,
  }

  unsafe impl Send for As5600Priv<'_> {}
  unsafe impl Sync for As5600Priv<'_> {}

  unsafe impl IioDriver for As5600Priv<'_> {
      fn read_raw(&self, _chan: *const iio_chan_spec, info: IioChanInfo)
          -> Result<IioVal> {
          let client = self.client;
          ...
      }
  }

In probe(), capture the client once via deref coercion (Core -> Bound)
and split the driver struct so the registered IIO device carries the
same 'bound lifetime:

  struct As5600;

  struct As5600Data<'bound> {
      _iio_dev: Device<As5600Priv<'bound>, Registered>,
  }

  impl Driver for As5600 {
      type Data<'bound> = As5600Data<'bound>;
      fn probe<'bound>(dev: &'bound I2cClient<Core<'_>>, ...) -> ... {
          let client: &'bound I2cClient<Bound> = dev;
          ...
      }
  }

register() then just returns Device<T, Registered> directly instead of
transferring it to parent devres -- that transfer is what forced T:
'static in the first place, which is what made storing the borrowed
client impossible and pushed you toward TryFrom.

I built this end to end against current rust-next: compiles clean, zero
warnings, and zero changes to rust/kernel/i2c.rs. Happy to send the full
diff if it's useful as a starting point for v7.

Cheers
Igor
