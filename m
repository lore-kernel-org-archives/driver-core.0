Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE5E39EF1F;
	Tue, 17 Mar 2026 22:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788372; cv=none; b=rpHu1tM6Fcy5ZHEbSP9EcxLbIW9M6KNuDK9ILJhoyCoAdA2/5lBakKeL50ft1BA2T2yx7bXLewTHzurgeFH4XCm07ZCBOfSudaNKKJa+EYZsxFMvUlWOwmbDLgSAraoAMnTfd+pXUlVLuXu8OKq1Nmd2XpiS8jUWFTXWdlL6OB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788372; c=relaxed/simple;
	bh=KsHFovT6HtCuvOR1gM+fl5Ra+CbSGlrhzcxLdnFmNb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=aNpzOUm0rNlBUgBDKy58ExCOluCvrkGqb0QrLJV6Hsl+rB8p2Dow8xgsBdgGAAJVXEuBnBuy9zy9+B3/4MFJ+aqV9REQFFv43JTVwt3fwTsLiUqDs+F0lG+6P9Uzhacc4tyHjQbgp/SqjzGzJKfpNhXNjxxf0MwVwxxiw6qF7C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXKPPOGz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXKPPOGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8007BC4CEF7;
	Tue, 17 Mar 2026 22:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773788372;
	bh=KsHFovT6HtCuvOR1gM+fl5Ra+CbSGlrhzcxLdnFmNb4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=aXKPPOGzKErQnf9L3RzFU+mz9mhpp68WZmQOaQ15YcZpRIVaLDUPV3IYgpGok/3xj
	 WivjV5ymwLw3oiuuhrhmOEswM791TOGJKEOVWnGlZ8ZbTC63Ujw/afknQX+e6KMLFF
	 GwugAfV5dwY6TpiCLLaLBIwtYs9OVLwJHLW9EhWaGCNbvQDqQmeEWmISXil/D0q037
	 C2T1eBb0C1yMWYZtMYCFcAffkKMZpMRPNQLuHXDpre5UQHbPKtbEKwlUciQcQMkdjX
	 yhu0Bm1kquEw03tWDY3NOrG7a9nmAYjnF9sscWjXaqfTToNTlFu8dZU4QqQVmsUd5Q
	 JLSY/rVuP+d8g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 23:59:29 +0100
Message-Id: <DH5FHZQ0NHDW.1EW10ZC8AM13@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/7] Miscellaneous devres improvements
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260202235210.55176-1-dakr@kernel.org>
In-Reply-To: <20260202235210.55176-1-dakr@kernel.org>

On Tue Feb 3, 2026 at 12:48 AM CET, Danilo Krummrich wrote:

Applied to driver-core-testing, thanks!

> Danilo Krummrich (7):
>   devres: fix missing node debug info in devm_krealloc()
>   devres: add devres_node_add()
>   devres: add devres_node_init()
>   devres: don't require ARCH_DMA_MINALIGN for devres actions

    [ Add missing node->release check in devres_for_each_res() and
      find_dr(); use kzalloc_obj(). - Danilo ]

>   devres: add free_node callback to struct devres_node
>   devres: use guard(spinlock_irqsave) where applicable
>   devres: remove unnecessary unlocks in devres_release_group()
