Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01FF357D1F
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320567; cv=none; b=tQFAUrUgNFMh226yR/aSznGJnRXKu/Uafr4bJJIIFhnNXkEMzPLNEyi5GShZAUxICELMNFloBv2bgHcJHEZ0hYsf0AQo1o3v6mNn+s5wTAgnN7vkLaaIP6j8w12pTnPEHSSLAgUjOSsz7GPjiuSGJFq36T7yo03mQHSRrtXQYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320567; c=relaxed/simple;
	bh=vTjvlSzyjhEG5UNEmts5z95WyKPl1H6sVa646JYtd1Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eVERpO26euGKrG+hfyAGU6G6BCiyVbJZ/pLYHmhXUKuQJbHYeOdIZl3f/Xa+kcB7s4r3jkH6dw1w/07WpeabgwUd3VNKBLfqil/IfnKoshDkXtvAQXkbzoFZttoi3g6OU09lrPzJo7kVJHjQo9gsjqLLvSlxdPUcN5fXfl6yjv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf13.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 4B4EF8CFDD;
	Wed, 24 Jun 2026 17:02:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id 0ABD72000E;
	Wed, 24 Jun 2026 17:02:41 +0000 (UTC)
Message-ID: <50755b746bb30bea3989db9c1f262d5257e8ee1e.camel@perches.com>
Subject: Re: [PATCH] coccinelle: Add devm_kmalloc_objs conversion script
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, driver-core@lists.linux.dev, Julia Lawall	
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 cocci@inria.fr
Date: Wed, 24 Jun 2026 10:02:40 -0700
In-Reply-To: <eed0c57a2c897e34d411229c3de41c5402791894.1781575297.git.joe@perches.com>
References: 
	<eed0c57a2c897e34d411229c3de41c5402791894.1781575297.git.joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 0ABD72000E
X-Stat-Signature: mpcswntk4zte9euj4nggo1mdaxfgb9qg
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+NPJg0H/Y4AleE2CoSjDsUZDCUVcqnbps=
X-HE-Tag: 1782320561-665375
X-HE-Meta: U2FsdGVkX18A8PO+/RaZHil8OAbKf+Ud1jEx6YhUJFWiv/KoOWxjDZKAw/SrsKGc3jPCHhOUuN9mI/mA/+yBwiWk2ddAzmNKa0L4GI7jNdNf4mfBMxCaGteAxXNfoEtfWB4JJEr5ea/Pxq+0d4UsfqFVMTXVksYi535Ox+4lSUbYQ7ZqNjh/sKCjRNNfyUiagR9rx5Yl2hL8FmGxpiPDia5bVFEWjf5/1pH2oF/gG8YhBSO/konSz1evj11Xp+ee3Y3RnuJeftbO7m9OWLNT3C8vr5vQucKWaQT/GKr0CkIE4MRn5F2g1yMBCm7+QFh8

On Mon, 2026-06-15 at 19:10 -0700, Joe Perches wrote:
> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script=
")
> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KE=
RNEL arg")
>=20
> Finds and converts sized devm_kmalloc-family of allocations into the type=
d
> devm_kmalloc_obj-family of allocations.

Its been a bit.
Any comments or negatives about using or running this script?

This script would change more than 8000 instances in more than
5000 files in Linus' current master.

$ spatch -D patch --very-quiet --cocci-file ./scripts/coccinelle/api/devm_k=
malloc_objs.cocci \
    --include-headers-for-types --all-includes --include-headers --keep-com=
ments \
    -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include \
    -I ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./in=
clude/uapi \
    -I ./include/generated/uapi --include ./include/linux/compiler-version.=
h \
    --include ./include/linux/kconfig.h .
