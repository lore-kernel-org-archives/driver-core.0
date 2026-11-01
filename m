Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577118;
	b=OmT8n0e9VE2jFusjMqhJF3eH2BMNTfPcgngYL8pIvhz6D3tWBlk6sYAzwu662mcjrtt7
	 42TzSHru2C7EKyxpF8oQBTfibXSogI2LQJ9jToUQ59dkE6Ho+/jx8B+zW2mQH51T11szp
	 SOnSNPqSzhHf5enlf7h7K/kLiIKSRX8oKEyqgaNW65hq776uMYyCD2P9S+4C8AksxgYIN
	 w7xgfOw3EcG1w462Dvf4lk6EOV3RUG4ew6lnfianfCLR/KK3NeQBekpxaP6339oHLgMLK
	 OWTJB8YpRQ1IozEykXvp9z8QT16ri30wOxUwFfIRJxORdPbFdKAsPKnMhwQB/HcaIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577118;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=KIvY7c6eGNR1PYr4Rw2sHXHPIR5Jl1oXe/FN4rg1gXs=;
	b=4uyOtEYacc61am5TQJYLUp/7xNmOFyZAIolMdMijRtm3rV9yJiAPkPTCUPIsvhGYMunJ
	 mywWdi1ME4shQM0XD+Pi/Sgpr5wBnhin/4Mj2K44yLDxg497yHn7MHkWpYS5mTTPwOJ10
	 BsRWjocN2RtjkC7hRjfw2fGMXsubQruUXrGJX280jb/iHis3DDSqM1b4xQrtXz4/gavbQ
	 32DrOEect3HEQSgk2wZ12LQ3Lm443LDi1ua8OJ1zMJkksYf2TU+f8OpWB8eb2dv5SGNtR
	 LqJWeJY8De/Xznw14cpcFM5wkcpKzZ4QckvUArwtM8+RaYw2EM8Hm2pSnQfnu0cj3XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=iee5eqVz;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F6606A324
	for <driver-core@lists.linux.dev>; Sun,  1 Nov 2026 23:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550F6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=iee5eqVz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KIvY7c6eGNR1PYr4Rw2sHXHPIR5Jl1oXe/FN4rg1gXs=;
  b=iee5eqVzXL2zTBc/zdr53NR8ZlmyDjYaWBIjFVDBezg6j066xMnatFRE
   AGh0n1ekNNX5+Y1FqfjsSBZXdzyC25rh64G+3LSf5dhhe0Bidv2KBQA4s
   1bDJpVFSOBVcfpBvp2vJzIQbUl2o+TAQbPbUkdosppnxERt+GqVW+qVTK
   M=;
X-CSE-ConnectionGUID: KvlqFKkSQByscQ4HsivZmQ==
X-CSE-MsgGUID: cwhUsx3XTdCozV56cvniZA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,190,1787004000"; 
   d="scan'208";a="303236714"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 00:51:54 +0100
Date: Mon, 2 Nov 2026 00:51:53 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Joe Perches <joe@perches.com>
cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Kees Cook <kees@kernel.org>, driver-core@lists.linux.dev, 
    Julia Lawall <Julia.Lawall@inria.fr>, 
    Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr
Subject: Re: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
In-Reply-To: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com>
Message-ID: <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 1 Nov 2026, Joe Perches wrote:

> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERNEL arg")
>
> Finds and converts sized devm_kmalloc-family of allocations into the typed
> devm_kmalloc_obj-family of allocations.

Applied

>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>
> Maybe this might be useful to run and apply just prior to some -rc1
>
> This script would change more than 8000 instances in more than
> 5000 files in Linus' current master.
>
> $ spatch -D patch --very-quiet --cocci-file ./scripts/coccinelle/api/devm_kmalloc_objs.cocci \
>     --include-headers-for-types --all-includes --include-headers --keep-comments \
>     -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include \
>     -I ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi \
>     -I ./include/generated/uapi --include ./include/linux/compiler-version.h \
>     --include ./include/linux/kconfig.h .

I'm not sure that --include-headers-for-types is useful.  That is useful
when there is an expression metavariable that is required to have a
particular type.  I don't see that here.  I also got around 5000 changes
in Linus's current master without using that argument.  I didn't try it,
but I think --no-includes would thus be fine.  --include-headers will get
the changes in the header files.

If the --keep comments argument is useful, it could be added to the
semantic patch, by putting #spatch --keep-comments at the top of the file.

julia

>
> Lightly tested but directly copied and modified to update the devm_ uses
>
> Its been a bit.
> Any comments or negatives about using or running this script?
>
>  .../coccinelle/api/devm_kmalloc_objs.cocci    | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 scripts/coccinelle/api/devm_kmalloc_objs.cocci
>
> diff --git a/scripts/coccinelle/api/devm_kmalloc_objs.cocci b/scripts/coccinelle/api/devm_kmalloc_objs.cocci
> new file mode 100644
> index 0000000000000..322f79a2d9654
> --- /dev/null
> +++ b/scripts/coccinelle/api/devm_kmalloc_objs.cocci
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/// Use devm_kmalloc_obj family of macros for allocations
> +///
> +// Confidence: High
> +// Options: --include-headers-for-types --all-includes --include-headers --keep-comments
> +
> +virtual patch
> +
> +@initialize:python@
> +@@
> +import sys
> +
> +def alloc_array(name):
> +	func = "FAILED_RENAME"
> +	if name == "devm_kmalloc_array":
> +		func = "devm_kmalloc_objs"
> +	elif name == "devm_kvmalloc_array":
> +		func = "devm_kvmalloc_objs"
> +	elif name == "devm_kcalloc":
> +		func = "devm_kzalloc_objs"
> +	elif name == "devm_kvcalloc":
> +		func = "devm_kvzalloc_objs"
> +	else:
> +		print(f"Unknown transform for {name}", file=sys.stderr)
> +	return func
> +
> +// This excludes anything that is assigning to or from integral types or
> +// string literals. Everything else gets the sizeof() extracted for the
> +// kmalloc_obj() type/var argument. sizeof(void *) is also excluded because
> +// it will need case-by-case double-checking to make sure the right type is
> +// being assigned.
> +@direct depends on patch && !(file in "tools") && !(file in "samples")@
> +typedef u8, u16, u32, u64;
> +typedef __u8, __u16, __u32, __u64;
> +typedef uint8_t, uint16_t, uint32_t, uint64_t;
> +typedef uchar, ushort, uint, ulong;
> +typedef __le16, __le32, __le64;
> +typedef __be16, __be32, __be64;
> +typedef wchar_t;
> +type INTEGRAL = {u8,__u8,uint8_t,char,unsigned char,uchar,wchar_t,
> +		 u16,__u16,uint16_t,unsigned short,ushort,
> +		 u32,__u32,uint32_t,unsigned int,uint,
> +		 u64,__u64,uint64_t,unsigned long,ulong,
> +		 __le16,__le32,__le64,__be16,__be32,__be64};
> +char [] STRING;
> +INTEGRAL *BYTES;
> +INTEGRAL **BYTES_PTRS;
> +type TYPE;
> +expression VAR;
> +expression GFP;
> +expression COUNT;
> +expression FLEX;
> +expression E;
> +expression DEV;
> +identifier ALLOC =~ "^devm_kv?[mz]alloc$";
> +fresh identifier ALLOC_OBJ = ALLOC ## "_obj";
> +fresh identifier ALLOC_FLEX = ALLOC ## "_flex";
> +identifier ALLOC_ARRAY = {devm_kmalloc_array,devm_kvmalloc_array,devm_kcalloc,devm_kvcalloc};
> +fresh identifier ALLOC_OBJS = script:python(ALLOC_ARRAY) { alloc_array(ALLOC_ARRAY) };
> +@@
> +
> +(
> +-	VAR = ALLOC(DEV,(sizeof(*VAR)), GFP)
> ++	VAR = ALLOC_OBJ(DEV,*VAR, GFP)
> +|
> +	ALLOC(DEV,(\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\)), GFP)
> +|
> +	BYTES = ALLOC(DEV,(sizeof(E)), GFP)
> +|
> +	BYTES = ALLOC(DEV,(sizeof(TYPE)), GFP)
> +|
> +	BYTES_PTRS = ALLOC(DEV,(sizeof(E)), GFP)
> +|
> +	BYTES_PTRS = ALLOC(DEV,(sizeof(TYPE)), GFP)
> +|
> +	ALLOC(DEV,(sizeof(void *)), GFP)
> +|
> +-	ALLOC(DEV,(sizeof(E)), GFP)
> ++	ALLOC_OBJ(DEV, E, GFP)
> +|
> +-	ALLOC(DEV,(sizeof(TYPE)), GFP)
> ++	ALLOC_OBJ(DEV,TYPE, GFP)
> +|
> +	ALLOC_ARRAY(DEV,COUNT, (\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\)), GFP)
> +|
> +	BYTES = ALLOC_ARRAY(DEV, COUNT, (sizeof(E)), GFP)
> +|
> +	BYTES = ALLOC_ARRAY(DEV,COUNT, (sizeof(TYPE)), GFP)
> +|
> +	BYTES_PTRS = ALLOC_ARRAY(DEV, COUNT, (sizeof(E)), GFP)
> +|
> +	BYTES_PTRS = ALLOC_ARRAY(DEV, COUNT, (sizeof(TYPE)), GFP)
> +|
> +	ALLOC_ARRAY(DEV, (\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\)), COUNT, GFP)
> +|
> +	BYTES = ALLOC_ARRAY(DEV, (sizeof(E)), COUNT, GFP)
> +|
> +	BYTES = ALLOC_ARRAY(DEV, (sizeof(TYPE)), COUNT, GFP)
> +|
> +	BYTES_PTRS = ALLOC_ARRAY(DEV, (sizeof(E)), COUNT, GFP)
> +|
> +	BYTES_PTRS = ALLOC_ARRAY(DEV, (sizeof(TYPE)), COUNT, GFP)
> +|
> +	ALLOC_ARRAY(DEV, COUNT, (sizeof(void *)), GFP)
> +|
> +	ALLOC_ARRAY(DEV, (sizeof(void *)), COUNT, GFP)
> +|
> +-	ALLOC_ARRAY(DEV, COUNT, (sizeof(E)), GFP)
> ++	ALLOC_OBJS(DEV, E, COUNT, GFP)
> +|
> +-	ALLOC_ARRAY(DEV, COUNT, (sizeof(TYPE)), GFP)
> ++	ALLOC_OBJS(DEV, TYPE, COUNT, GFP)
> +|
> +-	ALLOC_ARRAY(DEV, (sizeof(E)), COUNT, GFP)
> ++	ALLOC_OBJS(DEV, E, COUNT, GFP)
> +|
> +-	ALLOC_ARRAY(DEV, (sizeof(TYPE)), COUNT, GFP)
> ++	ALLOC_OBJS(DEV, TYPE, COUNT, GFP)
> +|
> +-	ALLOC(DEV, struct_size(VAR, FLEX, COUNT), GFP)
> ++	ALLOC_FLEX(DEV, *VAR, FLEX, COUNT, GFP)
> +|
> +-	ALLOC(DEV, struct_size_t(TYPE, FLEX, COUNT), GFP)
> ++	ALLOC_FLEX(DEV, TYPE, FLEX, COUNT, GFP)
> +)
> +
> +@drop_gfp_kernel depends on patch && !(file in "tools") && !(file in "samples")@
> +identifier ALLOC = {devm_kmalloc_obj,devm_kmalloc_objs,devm_kmalloc_flex,
> +		    devm_kzalloc_obj,devm_kzalloc_objs,devm_kzalloc_flex,
> +		    devm_kvmalloc_obj,devm_kvmalloc_objs,devm_kvmalloc_flex,
> +		    devm_kvzalloc_obj,devm_kvzalloc_objs,devm_kvzalloc_flex};
> +@@
> +
> +	ALLOC(...
> +-		 , GFP_KERNEL
> +	     )
>
