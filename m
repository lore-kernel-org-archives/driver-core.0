Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138A3B83E0
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748209; cv=none; b=s7thyOM88nNOF72stOGOhn0AApp7CqZGr23wIYLeyz17Q8Fp6/GrNwi7WX6I8jrLwPNlOBHfI0qCYfiMy/VhuRPaPLlMjjYlDtIhnKXGIXZhCQsTsoc0AbqEYo1IexVcATBMcq8ivIpishrAsYWSrz4jP2wIPONj8LwLyTFiXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748209; c=relaxed/simple;
	bh=y6lUUJwNmJwWDTpMLkBp1YAtLV9LN/nEevAEE/TK01Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqtZ7AOUlSvxMXrZEp2i6w+1Ty2V8qT0IN0c+Zq44345KgV8noTuW5OyXWHrCsQjYt3nQShYyD9MRJHzWTChj8tJnyIARO/fuhWE+mRnSzIErrvVsmQIK3v/Loy/4nxJSJ44+uPnrHYWB6ypvCMGwXhwhUjhPe/01VRFhuuEpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZNM2ESMI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZNM2ESMI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1598108f8f.2
        for <driver-core@lists.linux.dev>; Mon, 03 Aug 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785748205; x=1786353005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GNJHA/wk3B/tLgEj5BiBlQSmADQEGBijFgHvx9KdQ=;
        b=ZNM2ESMIzkalPgTJF4v6IjGLdk4Y5ERfTfUPvdcAXNb7vRSkwqYlmLrp5n0sEDjrJt
         xIxgYTFnwLsgZqVKlfFR/kyKUBOfmGJqocuqbMpwvC0MHYZhJ8POunTlCuc+eV7I8Bnh
         t078djGBBpf4Vq8uf6/mciV4OVAmcKUwZhppzBv+CAQSFO+1fVpEqWObS7JGK9UoA9o2
         5Zr+uEPuCiFAExCbTo93kpIX2Co7IWkdcLfCh1h39BRIIr1w36MVAnKE9cgK1jbCXusQ
         W2NC+7s30Q4Kw4O7s8Wup2THRKa+21u2Wgf1zaXodTCgHoRaMiAr1C6OnM6+QaPD97yY
         kFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748205; x=1786353005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GNJHA/wk3B/tLgEj5BiBlQSmADQEGBijFgHvx9KdQ=;
        b=NGRkYasRwmFUATBlyjvAHcC36D2gw/RYQdueAys1kl8+OmE9F+mdJD05Q22U6D4OYr
         5/FicywzWbHis/jXA5IYBuDAyNfwcWmh47mJXCwbKrd1rP3hKdih7VUbOibvjVLlA5HF
         B2Es2GPXWHiNXah2kS0gbFnk0wEWAP38Ji8Po1K9JzwzssZMKxb7s9+dTqd7CPypFVxf
         1On0HMSwckOeK6h26oWFXIjRnJvmc+w/SO0vm3KZsEYZbOhXrmZ/qN/AoKblhdmJzD5m
         +uL+Di2bpWW7SETBiIMD6S+FKCObXzku7M4Vz9nC7AZbVL+HQ3byg/Fw9A5pVSKQkAYb
         Bw/w==
X-Forwarded-Encrypted: i=1; AHgh+RoLtoc2jCjMji8WJt49iiXqbfWegdHQtCzpcwfbF3X5+y/l08OdYjAIfY+HKsd5ajvLJpOUyoeySwJzmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhAoAwQFIrb1pYV1/WTXJ4e2VGvTiFsMwZDhJY/1SoEBCawZou
	7O7b23kEYD7hAqFS4Mx6D5h7os0SiWfqfXGT15wh4wcRyVpUFcbeRsZVoP9NX3l9yc4=
X-Gm-Gg: AR+sD12zDtGtA7ra1u1x0WHeM+l4i2Ixspg4229Ts29Z4qbOeCjWw3WpYHcqw6lcT0R
	hns4o88OExzCi4gtFElESs3+gWSELWLMinRMxAtAUPk04DwY7ZXHHPHmvi/kVYbbPABjj6QcWIj
	/r0D2YQH7vq4ZZgxNgqcAMso3h1aLeN62PB7KjBDM00nixI3hCCOSOpSETvbkjR4lLdNr0BntLR
	lW9snn/xFZ4UVqIjpkT8Ws8ymjOb/dO0rITQKNL2/Gmt4RfFELQfZlF4sO1myKbccw9WbBx+CuU
	cLmsQ5WCVs1UiBsPNaWA5kkkBjJztDnu5TJIH4dJjspachPaocLDOeR6B1D60GTGlS19AkTwvlU
	fvPnEj/vvyAR1Y+I4NuWPpVFHgBVMXfGS/VaJxiJwCPbUP0bbhAC19S3aXW55J0eic8WGMDQrbN
	mTkm5wgM/QLMERVntk1J8IBEfUinvZZgltfGtYSpfWmFSCHI5wXCaMtIUEaHGIKbBL8KvAe2S0V
	8Vmj1tvOXdmJE3szFiemGqtZfO68TySNFjS6kLzqA+cl2aJh7AakmJlob1ZeV2Ry8Zk7XBgqQG0
	u506vD/uukqpwW7ipv34ClphTIPZzJQ=
X-Received: by 2002:a5d:46c1:0:b0:47f:8b9e:f457 with SMTP id ffacd0b85a97d-47fd72b0552mr16078486f8f.17.1785748204889;
        Mon, 03 Aug 2026 02:10:04 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6cbsm28027816f8f.23.2026.08.03.02.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:10:04 -0700 (PDT)
Message-ID: <e8733203-29e9-4a3f-b41c-198dcf1d5273@suse.com>
Date: Mon, 3 Aug 2026 11:10:02 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc
 abstractions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann
 <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>,
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
 <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
 <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/31/26 8:29 AM, Miguel Ojeda wrote:
> On Tue, Jul 28, 2026 at 10:39 AM Alvin Sun <alvin.sun@linux.dev> wrote:
>>
>> Back in v3, Gary suggested this series go via the rust tree.
>> Would you be happy with that, or would you prefer a different
>> path? If so, is there anything else needed from my side?
> 
> That is fine with me, but let's see what the modules maintainers think...
> 
> Luis, Petr, Daniel, Sami: what would you like to do? This touches your
> entry, so it would be nice to know what your thoughts are /
> Acked-by's.
Looks good to me. I've replied with Acked-bys for the relevant patches.

-- 
Thanks,
Petr
