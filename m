Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3E3BAD9F
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747681; cv=none; b=eLy6QVU2GgI9m6OR0jaHz7+vdmWMnM7BdgrdWicWt7JZ1YxBZd+5Z9UQDBBcoA+dnhuXoY4x/z6agFORR4yyKtBAK8etSfNcqdd2gQdfxfDwUmUn1c0++/HxyCaHhhwpLG3q340X6ORpE2jr+mnNDcghCGDh6frsG4ieFKqhLJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747681; c=relaxed/simple;
	bh=A6jrGJQtDJIL30mxb3XxVFNiY/hbrxZT0aR9eyUYw4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riyYkWwAmR1v4ViI2gLERKPCVjrg1OJexoFbLu8bvpPmMLssm7qKycut4jNlBK7VuqthtiWjx8KmiU7Jz8SEyjabV6urA86+KpmvVLW7Xb68kcSvDahRk9Ro5/Q3ebGkmzgB5F+gbPN1RIBEVyPR7DIxMx4lXcmJzNztdKMCJbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=InVc9/PU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="InVc9/PU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1801045f8f.0
        for <driver-core@lists.linux.dev>; Mon, 03 Aug 2026 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785747677; x=1786352477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7c8ajU7Bc5fO7IMCQU0cwsLx5uJDTGm1qTHU9/J8vs4=;
        b=InVc9/PUYO47aWOHZV4pL+LzkbF1lTlCNR43eIQ6ynZI1xrEFb+C1gAwfVbKKAd+zN
         72L3ICyXCvIc7qWCDyTHzffF6RBjcej0F2QiUZNYkiuoMNkJKmR53khYmEam5RmTQmss
         JDMhg7q5VjZrumZKOjWUT5pXYtl9+t3TSxQUVjoD3+GzURyzQBajjEjh3YT0CPl3gzh8
         Dy6bCK/ATwcMiYxIjgfeO3DC0AfNRthkxwklv2MvIANbp442pU0gOOI04QgqwhQPFbD/
         CuwewlUEzetYQjAs+XUEpnQLlOSv5on/oNQ+GQbmTrflvPvF63QwfX0uZY2wt7ARAbA7
         zCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747677; x=1786352477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7c8ajU7Bc5fO7IMCQU0cwsLx5uJDTGm1qTHU9/J8vs4=;
        b=SAgGL0SjiwL+xWmpiKJe9NUjGOSZoi4LN3rjWTgxrBESQ5v7FJPNmRSvMBF2ByDmen
         FUHzhU9x3y4Po4zlo005d7+MwdO4gidXNzcLnJH+fsf9K8ER6HLE+ucQoLU2+BSh+F1E
         MKMuBEVNmf5VukRZJDZa/JPnPuxwSf6zKCFkCDv2kGUXs/5M+2Ws+/JguC9H0e5j78/8
         As6tLqp7hQ5MceDh7PKa4Y4SaEOIBYsqjDJkxo9iM/NbTLigkwEpaoxUUTOIflGO8BZu
         lowhuARx/GmsQQm4QLK92lQ9cW1nZPyobpnvmZnMHHEPLGcCXrQGwTRubIDqZHRphiSV
         SJLA==
X-Forwarded-Encrypted: i=1; AHgh+RpqKVwnHXJVh8oId2u2VISRCdEsxiRO5I5LhptGZwOpiUfZrfl0gSN9Kbti6wwOl16+/1N8mX5EXOoZNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdfNUebOe9r+orzgqx38TkmMDYCmw+60gmY4QfzSel/FMfqPHq
	kiCmDUj87Gr83PCxnIHZ4Gq3DuP1u8Knc1/Uzk0x5v9K2+EL5n1jAXZrbi7/Vc8JOos=
X-Gm-Gg: AR+sD109KbEmZOLb1gTZjDBN0Bijn3ertBnXKmUpjYQ3lol4d7FAlJaNIfko7yRFg/P
	5aSKljA0OzteJPGfyFkTqZuaqeIUXuDtzfMz292lvxnzNN1POUW58tNnX0y4LCI+el/SK+hCqAL
	/Bjw2Wi4d5JsewzdnWV7vjC/VqGG3C3PSDhkhI6QGab9lqVx3cuNfqqT1uKgFcfCnbDWpLSskcb
	3nWACrGUi7tM2dVJQ8y/qirofbzEkex8t7b1rJ8s9TA7ae96vjE/CjVz9LwGjPVxYoHgyU0p5rq
	gIWBgH6Po9aWdd35VbMeZErqgd4Ju8tAsvE8/dR3cb1/z117y73V2QzPLkPqOwtDIgxmiinUtYc
	SvUwUEvbgL+r7e02N69/jszstaMtovFMtmTvY6PI+SKjKXRDHIbBJR8LJTOpazQb3tadQYfsvQi
	YTGIR8SqPJ77cCvWEgjB0MY/W4hPKXLqR2kXEfZTj2sOZj2BNR3M9SUxm+uWQGtgGj3mI24rL8p
	3BQ6+jnatqfjJEXZyavi3JeYgf8U11bU4YjeDd698d0+8iftZUQXnap9agi7oePiZMTZz27oOLH
	RR6RIaTkWlvbTKn19wO6HF7n8KcH7n8=
X-Received: by 2002:a05:6000:481c:b0:47f:8ac0:ccd3 with SMTP id ffacd0b85a97d-47fd9fa5e61mr20758749f8f.2.1785747677195;
        Mon, 03 Aug 2026 02:01:17 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm29125053f8f.29.2026.08.03.02.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:01:16 -0700 (PDT)
Message-ID: <7b24e554-0f13-40fb-bc04-dd64cdb93528@suse.com>
Date: Mon, 3 Aug 2026 11:01:14 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/10] rust: macros: remove `THIS_MODULE` static from
 `module!`
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
 <20260723-fix-fops-owner-v9-9-c1c3af7f7bcb@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260723-fix-fops-owner-v9-9-c1c3af7f7bcb@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 4:10 AM, Alvin Sun wrote:
> All users have been migrated to `ModuleMetadata::THIS_MODULE` const or
> `this_module::<LocalModule>()` helper. The `static THIS_MODULE`
> generated by the `module!` macro is no longer referenced anywhere,
> so remove it to avoid having two sources of the same `ThisModule`
> pointer.
> 
> Assisted-by: opencode:glm-5.2
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Acked-by: Petr Pavlu <petr.pavlu@suse.com>

> ---
>  rust/macros/module.rs | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index aa9a618d5d19e..23b6a1b456b80 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -497,22 +497,6 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
>          /// Used by the printing macros, e.g. [`info!`].
>          const __LOG_PREFIX: &[u8] = #name_cstr.to_bytes_with_nul();
>  
> -        // SAFETY: `__this_module` is constructed by the kernel at load time and will not be
> -        // freed until the module is unloaded.
> -        #[cfg(MODULE)]
> -        static THIS_MODULE: ::kernel::ThisModule = unsafe {
> -            extern "C" {
> -                static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
> -            };
> -
> -            ::kernel::ThisModule::from_ptr(__this_module.get())
> -        };
> -
> -        #[cfg(not(MODULE))]
> -        static THIS_MODULE: ::kernel::ThisModule = unsafe {
> -            ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
> -        };
> -
>          /// The `LocalModule` type is the type of the module created by `module!`,
>          /// `module_pci_driver!`, `module_platform_driver!`, etc.
>          type LocalModule = #type_;
> 

