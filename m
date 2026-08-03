Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B2B3AC0CB
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747260; cv=none; b=Px6BllhxhtW3pd/4WA08owX1w3K527T+NOeIZJv+TT5syyEBk79/KIkNN1cez6Q96D+HH1mL5qoy+z55W8E/gGLEACNtoN1Lb5bcYxPN/j8aAYtcXjnsSD8pQ91nOjWPH2Co1ZII6gguNGygYxq5r5dPEsvDO305TdRY3csca9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747260; c=relaxed/simple;
	bh=HDh0tHN7Imku5gQvjhAPRn/aa/QQQichvxD3Lw2UsfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4/vxIVqU4808qJ0ygfCkQTTpgg9ziQGKUNItBuIbzx5elSLoUQ8FeERLU6lXS7iWoJgPnLc9wH9Y6e1Fi6/jyrQNfB3ljlzveTq5B1/mqPM7Q0ZJ3oPaKpx/q7ibA8zvAdsI3XlBkAk09xAvhjxbhvd/mGepVFk40iWTdTbgfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bf1BEsQl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bf1BEsQl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so10883115e9.3
        for <driver-core@lists.linux.dev>; Mon, 03 Aug 2026 01:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785747256; x=1786352056; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPO+ED0ot3Taa08GbV6IzKrIjqgkBaW3P1eEmTzgiUE=;
        b=bf1BEsQlO9INpPneNL0li4X3IpfOBycU8ay26cGVKnIQQvUwCNlgExbI+p0DY3fAWl
         CqaHL9gcbrL99ktdUfnL6OSYxEuPcS/j9LQvQX5n3pDc2OSs6WJmU4tDSNjrryFgdWe+
         bjY+2JOe3RKyQri3rc1MUjz2FKFUavhiNfCO/DVr2KrAwHgng1B1bVINkzigiaFSlP6Y
         UxQTOoeDW+eTbTx2NylNuzMdu3Q7Y+lgkAJeH6eb38mIcRAsiuXMB8RumQWVS+SIsGOL
         9Q4wghO8joz+m02TdstnnqIrmefITnQRT8TjnUi0/dNb+4oBkiZCiXUdBGOLWFFx1MhN
         pxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747256; x=1786352056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPO+ED0ot3Taa08GbV6IzKrIjqgkBaW3P1eEmTzgiUE=;
        b=WwSsLGS2HZB2rsHDweTqXZz+YUxmXdgDpyJOVDhXtU5cx+NoDXCnrcA5zY63VLP4xy
         J/fiEQ0cmtCRXeRw/Q2OIh7bv33cMSsoK35FCqC5oUEKLraeNjOtiPOxEvYTOYbBtAD3
         nIIvURvEUQe7oc8S3fikMKcBreAhDEhgGaye9Fw/3cG8y0N/rP43Yh+zWsN1SX5uwsPP
         xnGJG0Dzd4a7M++ywfgeyKHfPMu+iWLdDOH6MoQD+LFa82DMUHoenMAIS/g5idbeBub6
         u1A3W7etFYbKF9qNDjTpT/MtSoJvsE4EmRBP79+YZxjYMyichSpUS8EAPmEk91K2pBLV
         7LDw==
X-Forwarded-Encrypted: i=1; AHgh+RqJQY1BI6YbqjLo558YZ8NhOgiAemyk81nlKR2hHPnEVmawr5ed13B151yI0GhxTiW8J56xP8N9UrqcFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBKcDZqZPr6F/Y0tlUJzRsV0RPLf8k2HkLVc3VyunKXwA++f3N
	/30u+lppKinQ2X5+iyVdkDJ+F+303CZuJU6cmrRQo5Oyfl6HI9+f88bgtPTQTC28WYc=
X-Gm-Gg: AR+sD10vngBd/VVnAbsEjNgFzr9zB4vaspCvqimaR6UghbfJQUkf2O5fjL4w8UB4pGB
	vgmEXLVW9hGkAmsiYjmOoVLUlJEijNCg4eqk0C/RMZr355IX9enrnG0/m/VL4NivbVRUq0wTXqR
	BhlvlT1zq8TIPtxmg3U/yGKkHTcTeUl1RWbUYSCwkgsh7izgD/VzSUatcye/KXuP3eCsOVTpViC
	mkQDX16mYFxc5QEKt6PBarSI7aE4+POdzEssm7un9fwxAQgonT3eSI0+xB82MfwhYsZRR8b1/1+
	nHbGio/OmA64M87Nq77/w6iGSplf/xIZNLuMp/mppG4Uu+ZHZ4H5o5DfgZkSXM3VQuIxw0iLvaa
	w+wyzXUanCY4lhJY+zrXW9L0m00BhrVxqy75KWvAVcz+kPGFrlLOc1i6Nco9zCAZVbCw7H5yHMT
	MmeQUdQjNTEmifGgZEfDjSBlUtd1xnvd4NO2+BJvd+2vi0HcQWCADNje43ZeLYlum+ZxQfcYqih
	mvSHHoZ7AJRzguhFH01h+/GbLiFFtWp2HmFItJjG/yfWh+chbmMB9l3UzGu+XJSrenys0OAfWBB
	by4GYvErwUO4EmLIZm5bPbIxS840jp4mfHTdqz32eg==
X-Received: by 2002:a05:600c:5914:b0:495:5cda:52ec with SMTP id 5b1f17b1804b1-4980c662d03mr170527905e9.16.1785747255995;
        Mon, 03 Aug 2026 01:54:15 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b7afe6sm200011075e9.0.2026.08.03.01.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:54:15 -0700 (PDT)
Message-ID: <a6a83aae-2f51-428e-8e38-e6a36f095f13@suse.com>
Date: Mon, 3 Aug 2026 10:54:13 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/10] rust: module: update MAINTAINERS to cover
 module.rs
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
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
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
 <20260723-fix-fops-owner-v9-10-c1c3af7f7bcb@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260723-fix-fops-owner-v9-10-c1c3af7f7bcb@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 4:10 AM, Alvin Sun wrote:
> Module types now live in `rust/kernel/module.rs` alongside
> `rust/kernel/module_param.rs`. Update the MODULE SUPPORT file pattern
> from `rust/kernel/module_param.rs` to `rust/kernel/module*.rs` so both
> files are covered.
> 
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Assisted-by: opencode:glm-5.2
> Link: https://lore.kernel.org/rust-for-linux/8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Acked-by: Petr Pavlu <petr.pavlu@suse.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e035a3be797c4..74733de3e41ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17984,7 +17984,7 @@ F:	include/linux/module*.h
>  F:	kernel/module/
>  F:	lib/test_kmod.c
>  F:	lib/tests/module/
> -F:	rust/kernel/module_param.rs
> +F:	rust/kernel/module*.rs
>  F:	rust/macros/module.rs
>  F:	scripts/module*
>  F:	tools/testing/selftests/kmod/
> 
