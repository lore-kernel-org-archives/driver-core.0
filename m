Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7351A2DF156
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 19:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787858769; cv=pass; b=FCXR8/+H3aRpyhtZfh2M0f3EmSmANzkS2XeZoOzZ0DZxV39mUxMM72nfb/IOtjL56dfW3iqNl5KdXIMVL08gazxt5kmUxqyKKqxJxhqkEDsNdac2NgoQOfMvyBmcnIV7Nqpe8FM6JGAJZE/3jdy3L8YIpJxGL3aWbW75NqZxGbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787858769; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kjSTGT6PZWB0zTBnIlmozRoGnfdJNKpRAos5TxGHm3OKpvQHgBPkUT66SgUSxkFgQblF1bIDOlkaxHxeKHC0nuDP8QMQHFZGjD0iFhBBwQJgUE6IpGPS3DYJX0QoCYb0fntWusPzvVTAjwhG8XkQK2J8woU0QeFKK8XTA9DdN00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=H13VUpv7; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="H13VUpv7"
ARC-Seal: i=1; a=rsa-sha256; t=1787858761; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QZtvQzw94pHhSD24on2glLqDM/tETPQ229GS67EzMTawKmsQ4e9DdpoF7mFGJcqJ8QtNQHmAZU+1G8D0IwOL02TEoYWTksiDFAOqNPij7JyqcVBh94gREM03tGu1b6CiBnoyQSIOshd8Pg98iv3uw9l3T1tVP5KEyV0tDiDVJfU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787858761; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=M6WME/1kmGQmV1FnooUk7K1eVXhU8NiWDL7x/pyGtGpnk9jjugVIGQ/HPYWKom/lO09hoLmiaUIEIm6DFKIkl693wXeygr/iHliYnXrc4WTpoYi5To6vSOQpqeNh2DcH23E4V7wk0n6e0Q58BnQFBt23b1nE0Q0CGZwaUDH6Pv0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787858761;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=H13VUpv7cJAVqYs6xF+6B7NJT26tpsTzWIaKKbjGKNddZuZPZQolL36qJMZTumm+
	hUPWMe6qjZaw8syXHHEMioTygCqGTaCMVa70quAg4RxHhX5MwwnIXELS14uKJTZ+i1A
	xZszFYSwok52oneLGDUDEp6tDfBdLJ7ztClfmEa8=
Received: by mx.zohomail.com with SMTPS id 1787858758567387.6839901398175;
	Thu, 27 Aug 2026 12:25:58 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 4/6] rust: workqueue: add creation of workqueues
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260807165252.3849875-5-dakr@kernel.org>
Date: Thu, 27 Aug 2026 16:25:43 -0300
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
Message-Id: <A891C63B-050F-4CD6-8624-699615D451BC@collabora.com>
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-5-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
