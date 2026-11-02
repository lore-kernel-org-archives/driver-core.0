Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625863;
	b=rNL3isSdQFOw86NfHjuEzRTVPOCzkNyvNhrwzG8crckmvVFohiPoXq7jb7wufcvnhdAg
	 NExTgIrbM2ApV2rFVE14AlPIAKLmP0Cs3S5ZzVSykgclPcULgEcXqtW6QCL1fdUQR9XsD
	 IYE0vfHrP3wi3gVIR78MM0xbCumd6mT7lS473Pc7Qg4mbgTFR0DX2eGh/Cq4Jd8yIELFu
	 WSG0Tga/0hii2Ugfk8tiuyq2CoD1T+fXQY/11Lo6FfwLSUygMmkhsJVqscCETjXiBMl/4
	 dJojWkZ7JNlJIG9bib52KQAApz8te56J//DpeASJJd7i3dmeXqDt4Y+bXWxCODkeNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625863;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Spam-Status:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=6OMoQFhSD9uPr1PAtpO6dxNv49H72Shafoz2GMV/oD4=;
	b=CtNiEA2fpAUElOhuLmjTCTh8Fq0Db8oaQPIgvPEv5Sz84vMtb6dc17u2M/M4hfb250Ms
	 A5DdTrjT4CsFr/DrAU1/DvbP9fxYQJ7FNNq9yujhf/4Men61sfbAAAWD/ObLlan2A3yfq
	 3YiL1pqsx/DsIpdIeNyjMT4nqWxnNQCXEtxlYgzQpVYoCTLUFvRKYxAtMPImExQqf/Ee7
	 XjzWwCteDpRAcAUWdln2Z7Vx7G1/H1Rf81tP3BOOd5fP664nM57J/XDRyMAIbbd/cNFQa
	 qZAopk8NjPwFtn3btu0QOTfpTi9UckRxqwqRJ28xivJBnQitPA49fgJ48Ynvu/o+nbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82A3606A326
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 13:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D82A3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 5555F40D21;
	Mon,  2 Nov 2026 13:24:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id BBB802002D;
	Mon,  2 Nov 2026 13:24:12 +0000 (UTC)
Message-ID: <0df76d1a6ef8fc5b68fbb316eb6f3c5cc22f0472.camel@perches.com>
Subject: Re: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
From: Joe Perches <joe@perches.com>
To: Kees Cook <kees@kernel.org>, Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 driver-core@lists.linux.dev, Nicolas Palix <nicolas.palix@imag.fr>, 
	cocci@inria.fr
Date: Mon, 02 Nov 2026 05:24:11 -0800
In-Reply-To: <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com>
		 <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr>
	 <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout08
X-Stat-Signature: dk57tc4uaibxtmhkbsjwrtw87pinejyp
X-Rspamd-Queue-Id: BBB802002D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/fG62APAOp1gzsVmFy0AZGqLx5uKO3JxI=
X-HE-Tag: 1793625852-693149
X-HE-Meta: U2FsdGVkX1//Sn46R+Ih4ThsuJzgmL6hpjmCdzMad3WkAY86mnJHsXub6FBf2vmSMEAtIm7phF/I12tokv0R9AzlYnXlaTXTOTg0jJuaLRdtNGXz2a/s76wt4rTI80YzGcBepa7WA4JBoqqJdQ3vrh+Okv+yHfGUQ1H40mwfcUG+w0fIEt9ZD3neIirm1aXxRv2bcAxdCyUySSlIMWKg35gVZ4DKXE/p0y2CAkCUz8v2vD+xcoa91m/KZoXv9IfroUmvc6tzit5GnAwwxyeBz9Us/epXn2EIChfVHhqxbEX0gWnyR+p6zjmGo64B6vXXXXHr9geXYHzMQsfwUmxsbX7x1ieADxktOL3/CnDiACGNiy38G/23AW2u/wyndR+dmnT04wK8leh/Ik4X02BqJkyupg2/n9r9S+apMPCAZ73RcG63nzCma6/gf168nsgLRsrdmxKpExQ=

On Mon, 2026-11-02 at 00:52 -0800, Kees Cook wrote:
> On November 1, 2026 3:51:53 PM PST, Julia Lawall <julia.lawall@inria.fr> =
wrote:
> > On Sun, 1 Nov 2026, Joe Perches wrote:
> >=20
> > > Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion sc=
ript")
> > > with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GF=
P_KERNEL arg")
> > >=20
> > > Finds and converts sized devm_kmalloc-family of allocations into the =
typed
> > > devm_kmalloc_obj-family of allocations.
> >=20
> > Applied
> ease don't send this. I already did this. See the PR I sent for rc1:
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=3Df=
or-linus/v7.4-rc1/devm_kmalloc_obj

Kees, I cc'd you back in June on my first attempt for 7.2-rc1

https://lore.kernel.org/lkml/eed0c57a2c897e34d411229c3de41c5402791894.17815=
75297.git.joe@perches.com/
