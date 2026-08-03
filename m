Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEDA3B893F
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747622; cv=none; b=RhNa5M4WcMT78UP60QE0eRBA0vRUZ3LOpMDpAeygfsflrSZXC8y5PUWlj67ovDgLZunSjD4sjGZw+qWTXom1IB8mLP5b8d9rkUEpEudEBcwLSw7ifNYYDJZ1pjy4Jwju2yavJa2ChZ57cLj777vQ35WHeB+VWbZwLCQYkNClN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747622; c=relaxed/simple;
	bh=0zlJd9Yr6UpKiQThq/l7IWb1Lcot2jQVu687ixt9vMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZAFzUXEbFQsJiaBuY09zx4QqGOR2LbBsR8z3npdaYkh/YWa9k5PsjMv2pKZS6NCQw50Lih5Up+fzzv6PvvEsUuTvyPr485irmAowxprTbhYQMGg/XkV0NeMuxgtv13N+cr8EbUFPN7R/JTaqDYjn5NSowDmAGmtK2oNGuM8/PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UUjs8neQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UUjs8neQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso857777f8f.2
        for <driver-core@lists.linux.dev>; Mon, 03 Aug 2026 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785747617; x=1786352417; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MEAqomLnokyVR9AqA64rl9ZYCVmUcv5C80fBRfsQys=;
        b=UUjs8neQCo0OsAVL+rcaWmy0Rs5HCjbVg//6Mwm4yu+n9cEIko432y/f/6FolotANC
         A2RJW2J5g6JSUh6KGdaJO69kIUq6ro0+Qa6lpKabMghSwT1bQGs++NvC1wBLnm73stnb
         zCXBZ8TSt3mUtYROrF3VEtcs60YnLgXnQjHtoXxZ76k3klT2eqtcd1TgoP76iUxI0CyJ
         HE/m2sxI1MrEoNhu/e5XPpJtJWpMoZufWuKTPMZA+SOI2xQ7FuHcQMiOzn5m8CKdfdLL
         W295beYJD3Q5j+aJHXnMm9MxXDFJzpwsoRMNcrnCK15bxKaI/DUJm/0XQho62ff4FIC9
         zPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747617; x=1786352417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MEAqomLnokyVR9AqA64rl9ZYCVmUcv5C80fBRfsQys=;
        b=pPTUCHA8r7EvgDAUeHxFw9MCP35EyjooH0YLGX4FVTkG1D+1c8LtxeFZs7xXz1oBOv
         erpyA0DJPOyCSg4nYe1avuEcZXXGOkxINWtKzQZFow3tVB/Lv5/YMFoXM2ZkfBdbdnl/
         jHKe5/+bUYWFMbgr3qeOEQ880X/8uTnI07MlSwPG7eN9dwm7+B/g0c2tHKt6gWeVwV8O
         mnCYbZ6eeptV72Izj6GllyNx9T56jRv8qQLpG8/pSndIhNoc+4tuzRuYrXZX+JTOWFWp
         1aweOBar1OAIEgUVK7LwMmq2NvpEOMnBraea2fT0i31u4UdyMQciycC0kjawon9pmXIc
         6CLw==
X-Forwarded-Encrypted: i=1; AHgh+RrLSubs0RDzTQAHm6oFL/NxPgRfoww3R0TfB3TKsXGBK6ByPFTXlqrKSZSGN1YF4rpDpFugzwgeI7nSVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEmPx9SgEoyUPe70eKlqjkUzBbM/pUBGXCJ7hexv3OpEy60t3P
	Trc2EICTbqPPI8nMk8bjeeWVKeJzxrqtauMIAT6rxCC2MegbbKi1RNCIXyinQrJbyzA=
X-Gm-Gg: AR+sD10F8saxkqpA4nBnFLELKcAlqg2s9OOdENbciQfRXTatT7y+IJOi/7xndL91jnt
	P3mWREHCeI4bodjeT1c+YsBLNUj5I1cJAWNhpoxA897KRJS8VxCnhbSi91B8C4nK0ca4Rz25zlU
	/nVlrcFwxsUgRlXMwrWHLNsQkhXXUX1X+2m2bU27q1Nnl+9lvanTP2A4P+6w+ye1WI+3mm+mUYh
	z5L7HsDfpDPE9nlU0/jhhgB0h9EHnGCrVB+D2ywvGMjqNsDaXS1c8gXOe6VSj4r7ZTmgie4tz5Q
	u5Rv1ybgqAitzEQwO9LYxGsHNVm8rfLcOHzf4vHpDazIN4sN8NZxMEjSFRfCI0mhX6bmUkIpwxk
	iG8jh+54E9kpfS90WBSj7cznuUHYRh4xBwBSKRo+6mnNi5T0STNFyYYi7dS9i8iQNz3fUlgaXX5
	vm2mu1/5U9F8EyN8lQlvQrGVb6ZKi9/x0jmzIdbQBn8VpTH8yd1gtQmWT6cm++wx2b70RwsgExg
	+eO1+zBJKlfy9XUO5PFZ5BvJHTHaUpwHrjiIDlhcUXO+zDt3dgdDOlvxrs22u/t72UnFRYn/jV0
	DCqDwXFxb/w0qO52bv9o5I9IZcmLrlpRckVNm6615A==
X-Received: by 2002:a05:600c:871a:b0:498:952:e276 with SMTP id 5b1f17b1804b1-4980c66c991mr237479075e9.8.1785747617287;
        Mon, 03 Aug 2026 02:00:17 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807ba13e9sm314596535e9.13.2026.08.03.02.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:00:16 -0700 (PDT)
Message-ID: <6e9e8189-e27b-4279-9fed-b7da5da62419@suse.com>
Date: Mon, 3 Aug 2026 11:00:14 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/10] rust: module: add `THIS_MODULE` const to
 `ModuleMetadata` trait
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
 <20260723-fix-fops-owner-v9-2-c1c3af7f7bcb@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260723-fix-fops-owner-v9-2-c1c3af7f7bcb@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 4:10 AM, Alvin Sun wrote:
> Since `const_refs_to_static` has been stable as of the MSRV bump, a
> `ThisModule` pointer can now be used in const contexts.
> 
> Add a `THIS_MODULE` const to the `ModuleMetadata` trait so that modules
> can provide their `ThisModule` pointer in const contexts such as static
> `file_operations`.
> 
> Add a `this_module()` helper to retrieve the `THIS_MODULE` pointer of a
> given module type, and update `__init` to use it instead of the
> `THIS_MODULE` static generated by the `module!` macro.
> 
> The `static THIS_MODULE` generated by the `module!` macro is retained
> for backwards compatibility with existing users and removed in a later
> patch once all references have been migrated.
> 
> Assisted-by: opencode:glm-5.2
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Acked-by: Petr Pavlu <petr.pavlu@suse.com>

> ---
>  rust/kernel/module.rs |  9 +++++++++
>  rust/macros/module.rs | 18 +++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/module.rs b/rust/kernel/module.rs
> index be242a82e86d2..d713705984477 100644
> --- a/rust/kernel/module.rs
> +++ b/rust/kernel/module.rs
> @@ -42,6 +42,15 @@ fn init(module: &'static ThisModule) -> impl pin_init::PinInit<Self, crate::erro
>  pub trait ModuleMetadata {
>      /// The name of the module as specified in the `module!` macro.
>      const NAME: &'static crate::str::CStr;
> +
> +    /// The module's `THIS_MODULE` pointer.
> +    const THIS_MODULE: ThisModule;
> +}
> +
> +/// Returns a reference to the `THIS_MODULE` of the given module type.
> +#[inline]
> +pub const fn this_module<M: ModuleMetadata>() -> &'static ThisModule {
> +    &M::THIS_MODULE
>  }
>  
>  /// Equivalent to `THIS_MODULE` in the C API.
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 06c18e2075083..aa9a618d5d19e 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -519,6 +519,22 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
>  
>          impl ::kernel::ModuleMetadata for #type_ {
>              const NAME: &'static ::kernel::str::CStr = #name_cstr;
> +
> +            #[cfg(MODULE)]
> +            const THIS_MODULE: ::kernel::ThisModule = {
> +                extern "C" {
> +                    static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
> +                }
> +
> +                // SAFETY: `__this_module` is constructed by the kernel at load time
> +                // and lives until the module is unloaded.
> +                unsafe { ::kernel::ThisModule::from_ptr(__this_module.get()) }
> +            };
> +
> +            #[cfg(not(MODULE))]
> +            const THIS_MODULE: ::kernel::ThisModule = unsafe {
> +                ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
> +            };
>          }
>  
>          // Double nested modules, since then nobody can access the public items inside.
> @@ -616,7 +632,7 @@ pub extern "C" fn #ident_exit() {
>                  /// This function must only be called once.
>                  unsafe fn __init() -> ::kernel::ffi::c_int {
>                      let initer = <super::super::LocalModule as ::kernel::InPlaceModule>::init(
> -                        &super::super::THIS_MODULE
> +                        ::kernel::module::this_module::<super::super::LocalModule>()
>                      );
>                      // SAFETY: No data race, since `__MOD` can only be accessed by this module
>                      // and there only `__init` and `__exit` access it. These functions are only
> 

