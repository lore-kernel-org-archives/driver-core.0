Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FD8396B9A
	for <driver-core@lists.linux.dev>; Fri, 22 May 2026 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455171; cv=none; b=Li8r2DoWU0yqHpWDFeM2O1YTnCuB+raGtIojv47vlBEtpcTgp3h3jGG0ck4msBGk7yLogXfxFSlN+1Ql7qKXQnf87uXYIgRm3ktWmKDRHk7UOUuTsJqhdPOWpi35cVL0FX3thmyQSBPXNcFC6mlXXpzrY5BYmuJCoqijsvxyORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455171; c=relaxed/simple;
	bh=CrUvmAcH/6UNtp+fwPwFwq2VX4Qbk2+mAnahh35JAFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eirc8aSy6VNjD5AH5CN10TYOjwkb9Wp20rB4RUGMfO7jjWXF4Pq7OlbDIbaAYy/yc7bDIgOlxj76XgylgjGHcygZ7Qn2JnuD06q0wOKAaeDvvKXchdpdZiBVh/BTTUZD0j/qw7z8ve/kR4kIEcIose/zV2L9fpulmZUP6Mw4P8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SgI51cJB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SgI51cJB"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43fe608cb92so4535418f8f.2
        for <driver-core@lists.linux.dev>; Fri, 22 May 2026 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779455167; x=1780059967; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Z6hIMYgqhMrKKBiL1MJIdjEE5Rl1yfiYAVBlDccynQ=;
        b=SgI51cJBp1Y3wU61eKVfGSt57z3hUm3WEmd5fKjOT55PQaWT+Xs+NlhEb5Kh2BWPeY
         L3sQE951e4aYgfhA/c2fn7Fffn0AEXMYM6xH4OBLfoARg/mO9vyVyAY5K7LPab7TbbLA
         QZxhtyCfJwnjqryTYFwU7rkM45rOTxMhH+1MV1koJAPAayCV2r3pSLvOk3ymoQffSVk7
         3K17CAZk31FJxde7qoZvV2q2htaDvqBHuVq71bIlukl289nhcWt6PkuPHZi8iS2eLHBT
         eJMhcAeroRqf5xN88ZeeRs0LrBq6RGyWpGDTS/5bGXe/+SlQErcRdqQ79B72nr0oCRUm
         49tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455167; x=1780059967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Z6hIMYgqhMrKKBiL1MJIdjEE5Rl1yfiYAVBlDccynQ=;
        b=pShWB0zFr2VxIXaARgYzeN8UHfGuvQiJ8gaz4KtZagDfFchIQdmrOZkhr2fQbyrSKY
         g2xLjOafh1m+tt4d+h6kReEzIPlsxXvuzrLHrCULkKKtq2cJF6qxvaB9t5w8TgrzHZlf
         fvQzyFNzRmSmRA+QR2WxWobd/kPlrsRdMOzWCkfs9RygkU1hciQqtYQSULiA4UEDk6TI
         EYZ1zX8esaFEDxyABFil6T4fDC4LGssqQ1V6CIrsEXJCaEI4Jm1dWw+7q6nqqBx/2b00
         HFwlf28ZDphvXClevNonTIaUPGFe2uEdA+6oW2oskR/aYNnxij8ppwYxVIswibwwoImM
         COBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SIafKpxuU/+nfvMx/BSyShwTdyibA7MiXovSos64YLwpf5cen7aZyuTJ2GBw6Ck0mn/3qjSQfWYex+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDsk6m3u6ydpsAvAbuDyGl/Vj7j8ottbOBnPPwdyxEhZdB0Cpv
	QwqVap538vjMKKwov33ughvRx9qon8rDXlQ0RQV5zrXm7bY4GH1b1WnzSIILhWHsFVk=
X-Gm-Gg: Acq92OGj4FZDGXW0Stj/h/k3Tm9Tjmq97X0e8bGMCq8MLe9OnUZuTM/w82UwcOKz4Gv
	aUTgeFLMgSAmUZY73RTuXURnPT7m4i9Np5reSdJ68ji7muUUKK+3VM3yt7rqK9a9bQfcKWk5u9G
	Biaj3aJ4krso9FHBM7RV1TBhwHFSI2qYLFxVXSLhXAZmJxLQziZAznCF5JVNTL2r/Rw3pXuAsA5
	vwjgAYj7BTzRVY/R1BRAm+yAPANiPNmDT2CCpszWIdjNy5eaJlczuu3lax9tGaV0K00u42VEa7B
	2Qmfj8auiknfAkRQxMMlRD8+983Vj9akbcs0Zvc8dAd8Ief+8ALkreC3ZfWenRrCCyAa3mz12fE
	V/sbIB0Cp0Gl78TL+Klcd04v/LOW3kECr1Ql2nQas4krzRSmo1lEjUeMx0PI/v/q+OX6Lljhd2U
	SCXXq4dfe/CRCBtb94hnJCbjuF0tJoxYfIvEdKlrsi/y1spOl2w0s7QNE=
X-Received: by 2002:a05:6000:2384:b0:441:3144:efc5 with SMTP id ffacd0b85a97d-45eb38e4fd0mr5515739f8f.42.1779455166814;
        Fri, 22 May 2026 06:06:06 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d71688sm4196400f8f.33.2026.05.22.06.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:06:06 -0700 (PDT)
Message-ID: <a0b17be8-f7dd-4d05-bc6f-28b32d0b0785@suse.com>
Date: Fri, 22 May 2026 15:06:04 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] kernel: param: initialize module_kset in a
 pure_initcall
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rahul Bukte <rahul.bukte@sony.com>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>,
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org,
 Sumit Gupta <sumitg@nvidia.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 12:19 PM, Shashank Balaji wrote:
> Commit "driver core: platform: set mod_name in driver registration" will set
> struct device_driver's mod_name member for platform driver registration. For a
> driver to be registered with its mod_name set, module_kset needs to be
> initialized, which currently happens in a subsys_initcall in param_sysfs_init().
> The tegra cbb drivers register themselves before module_kset init, in a
> core_initcall. This works currently because lookup_or_create_module_kobject(),
> which dereferences module_kset via kset_find_obj(), is not called if mod_name
> is not set, which is the case now.
> 
> So in preparation for the commit "driver core: platform: set mod_name in driver registration",
> move module_kset init to pure_initcall level, ensuring it happens before tegra
> cbb driver registration.
> 
> Suggested-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Patch 4 depends on this patch
> ---
>  kernel/params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/params.c b/kernel/params.c
> index 74d620bc2521..ac088d4b09a9 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
>  
>  	return 0;
>  }
> -subsys_initcall(param_sysfs_init);
> +pure_initcall(param_sysfs_init);
>  
>  /*
>   * param_sysfs_builtin_init - add sysfs version and parameter
> 

The change looks ok to me functionality-wise. Sysfs is initialized
earlier in do_basic_setup() and other code, such as classes_init(),
calls kset_create_and_add() similarly early.

One minor issue is that pure_initcall() was originally intended for
static variable initialization. The file include/linux/init.h says:

| /*
|  * A "pure" initcall has no dependencies on anything else, and purely
|  * initializes variables that couldn't be statically initialized.
|  *
|  * This only exists for built-in code, not for modules.
|  * Keep main.c:initcall_level_names[] in sync.
|  */
| #define pure_initcall(fn)		__define_initcall(fn, 0)

The patch stretches the intended use of pure_initcall() somewhat in this
regard. However, other code already appears to do the same, so I guess
this is ok.

Additionally, I think it would be good to update the comment preceding
param_sysfs_init(). It currently says:

| /*
|  * param_sysfs_init - create "module" kset
|  *
|  * This must be done before the initramfs is unpacked and
|  * request_module() thus becomes possible, because otherwise the
|  * module load would fail in mod_sysfs_init.
|  */

I suggest changing it to something like follows:

This must be done before any driver registration so that when a driver comes
from a built-in module, the driver core can add the module under /sys/module
and create the associated driver symlinks.

-- 
Thanks,
Petr
