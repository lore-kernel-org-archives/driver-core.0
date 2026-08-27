Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F6639B49A
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851002; cv=pass; b=YSEFNTBXn1aV1v9bwpo2bxtqzDNvNo36PCLZjvQ4BZKSbJsuFr1sngQ/0QIFnQgZE1s3LEjkht3hhrZNugNs2o0J53HcQKY3L1gNOh6StJ/v1U6zHOasJOdsz6t8NKHT/EVGiems8aqwInbIMK3MbZVFG/HMLvPXRoSeIC11YMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851002; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PxZ5YYNAwxGvTiaTTq8/ZIMux3tS/kS26ROqnY8x255nbrARKN+bMdV2TutLNKfD+fHhXt+xlU9a/+dmz67z5suOMA+OSkb2lZyy4H392QbOUBqe80WbsIJlhWHwbj9nJ9Tr17nAUp4Gr5kEkcI2dFFFqTwgn4iIM5kzrQ29RmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=LNpgA8dG; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LNpgA8dG"
ARC-Seal: i=1; a=rsa-sha256; t=1787850988; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JOAlNzH688+o8SrgmHvakzGdaDr/4GcZ2R+OoIXCGi69uRkcLyJNsTRCCIfUYqYeWp5G0mwWH/u8vhHWuH7gmlA1MU6js/LdBf/NYFhMBFmKogG3xmDEem7R7NO2thUTOZOiwByifQXUGFFh/W/b+mEDpeAcTUDree0sWNDzKx0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787850988; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=VlSO9hmjBGedYtopaIeIJIi1M9Q8iiDjHF4RM0q/fQgi0p2jPhPy934TWnp1aEILfV+gZ/Kw7pen7w9DgeTZL2tqrtFSP6nX7AMVhF8Wg72VcN5Vhfy8NbRMTqv1kjZKCfIaeQMDOfceu40oFBKLICFxXsJKTTMEiZuFS0qS2Vg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787850988;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=LNpgA8dGR986kU/bPpIvHQ/RCVz4TMuyuTsYYAn0VXKH4VW5pjscTxUJseR7HsaN
	dMWKYvqqtSMK3BD4o/hYUZcW7AhWu4U0Rd6oDijKE8z6TTe+/7Hm9qMj0uTJ+/WS+ZB
	S/oGzpEyzgYkdow7iHIw3AdpoBbLeJBK5FhP8GCI=
Received: by mx.zohomail.com with SMTPS id 1787850986914903.1228389242743;
	Thu, 27 Aug 2026 10:16:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 3/6] rust: workqueue: create workqueue subdirectory
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260807165252.3849875-4-dakr@kernel.org>
Date: Thu, 27 Aug 2026 14:16:08 -0300
Cc: tj@kernel.org,
 jiangshanlai@gmail.com,
 aliceryhl@google.com,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 tamird@kernel.org,
 acourbot@nvidia.com,
 work@onurozkan.dev,
 jhubbard@nvidia.com,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
Content-Transfer-Encoding: 7bit
Message-Id: <CF3BD8EC-7611-4909-87C9-3EFA1DF3FBB5@collabora.com>
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-4-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
