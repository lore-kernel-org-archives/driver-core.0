Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2D30E0F2;
	Wed, 15 Jul 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123907; cv=none; b=M0dkX+Um05rovq7D1tXZu4wdtdURSerQWIp1hz71g+ksf8m8/HEeRltZTIaIeTjX/jm6jlXuJLYWPgCT5VsFW8YavJwndDkCoFFaR6WwDX22zExEbMiGmoHesmbwTXV6T9e+E3ChvZwZksISrhAJPkBuc1tvGgtfGS7tGMHpVnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123907; c=relaxed/simple;
	bh=sHLqqDZkJ2tlxEeUvgqPT6v+Fg5cAKsrdTpYK8t8x4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErFGYYtsZzO4XfSVhVN0RDtLm9Ame7o2DsA1AWPl2jbJDvGgtzWyv24cELts3BqtWAEmBr8Nn0fHAKnV3pSPstrTAycf7OVoTf9WUS6HoIwygG1T6JA68hpH0EPvBKu+rjAbZys3DcmTGCQFNgqntNXWYCN5bOf7HDGKhYyvfaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=r07IYSKR; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="r07IYSKR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a8B2tayrs+3I50qzhmAeIrxQaupDS+93Mjr4Vc8x3LE=; b=r07IYSKReo64wWS7QSGop24hLl
	L8Byh1+QgPpO7t4MLJflOnSHSVtgd0daCJCojgIvimhIF7itC4OT2laYTl1Okhr+cv/62zIzhD4yx
	f9DR8ds6bQg/EdyOaHKCoapGyVS/YhQUrAOu4JNRb//8zKXh6G02tltfDg4S0LTxFeFIejJdsuRtZ
	XrI1PDow3klQzkdnJfp+j75L5zEEFI+MwMUylBn/J/LwcQmiax91IaHAMZGFsx7q2KE7aXw8pC/dQ
	uf6PhqZFvLR4Vxb3rhx+BZ11acVA3RNQ0s0kS0Ir6vw2dcexPjRfSt5FKEr/eaaq84ZKVTAQwc0W7
	wOBGyTVw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wk07p-00369x-0s;
	Wed, 15 Jul 2026 13:58:13 +0000
Date: Wed, 15 Jul 2026 06:58:08 -0700
From: Breno Leitao <leitao@debian.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Pierre Gondois <pierre.gondois@arm.com>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] cacheinfo: don't propagate DT/ACPI error when arch
 supplies info (arm64)
Message-ID: <aleRvqKHtn280O5m@gmail.com>
References: <20260611-cacheinfo-v2-1-6069ef066cf3@debian.org>
 <20260612-jumping-spaniel-of-expertise-cbadcd@sudeepholla>
 <2026061242-riverbed-drench-1e2a@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026061242-riverbed-drench-1e2a@gregkh>
X-Debian-User: leitao

Greg,

On Fri, Jun 12, 2026 at 04:14:55PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 12, 2026 at 01:48:36PM +0100, Sudeep Holla wrote:
> > Greg,
> > 
> > Can you pick up this one as part of your next round of fixes if any or
> > for v7.2 ?
> 
> I'll get to it after 7.2-rc1 is out, thanks.

Is this a good time to pick this one?

Thanks,
--breno
