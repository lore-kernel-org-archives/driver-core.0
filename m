Received: from sender4-pp-e109.zoho.com (sender4-pp-e109.zoho.com [136.143.188.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8D42189E
	for <driver-core@lists.linux.dev>; Wed,  4 Feb 2026 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770217098; cv=pass; b=IA/OAhnhHla4xvFX8E02YGTVT2oZXPG30Z3516I/UWVVw91NJo0qsOPj/Vkcfpjkyp0aLlBYTrAc1XPCcqK9qHcGiFwsnrgdV1X5dpVjcxIAQNhOQ0vmZ2K1EVyhk4Rt7C22F8i3CpEyGszBj3mkNzyfv7rDk4r08bnP0qmRhPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770217098; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fw2EGgMPTJ1JZm4v2BHyS1TNwPekrUvzmR0FZaWzLXk+wqN8lbEnSwg0QCwue0y604no2FXTXvWjvMoXddrUpRf7FYNwP3FFXrLFX6HZRDnvpRJ23LyMmky/fnbhTj3M/DGn2+1MVuWMPJqKfXtknli0ODw/GO8F0YOgklv6l9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WUVPEuaK; arc=pass smtp.client-ip=136.143.188.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WUVPEuaK"
ARC-Seal: i=1; a=rsa-sha256; t=1770217090; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ir+LDMs30hupHToP2FOZsI7YXJNulmrPGYOLqWUbOJpmA4LksM/GFpl9TYXoSxXl2lUAh6TOgJHyD9C3W8LrMd16u3zTQCLY41qTwEVaP/Jsm4pEXpiNr+Esj3UulsEVbL0UvW2iZbLnZuapK60CJDYH0QGgfE+34w84vtM/1Ag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770217090; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=R1RwLog8glVf/kE5y+9THNKpBxeh+QxtNP5Iemo2chlXncjvSsTTE1K1m7KIKALblNh3xqNXmigLwui3llsFT7CHL6Qzh4yWd6M5AHtYr7jfeDgSnt48IhAk8R8chA49ddKJcuy/K5OBW02oMSz38pK+CHPL6HjIomCOxdC5fd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770217090;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=WUVPEuaKNm+Dx543tIE8FIQMVtHSjjOY75amedF/YqPcXGps1HCuEpQFFyE/qMmk
	3I4okVkz/acyrN3BPsy3h7Lgo6iuTT49dVYFmmGm2IZ1T9v09qQXUvCLJ31q96B6naI
	i3oZV5q5cU4B27G6O164juGewK2a+7uYRSoDJGCI=
Received: by mx.zohomail.com with SMTPS id 177021708973616.057995593715532;
	Wed, 4 Feb 2026 06:58:09 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/6] rust: io: turn IoCapable into a functional trait
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260202-io-v1-1-9bb2177d23be@nvidia.com>
Date: Wed, 4 Feb 2026 11:57:52 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org,
 Zhi Wang <zhiw@nvidia.com>,
 Lyude Paul <lyude@redhat.com>,
 Eliot Courtney <ecourtney@nvidia.com>
Content-Transfer-Encoding: 7bit
Message-Id: <B77BB71D-EE7B-461A-AE05-B379FBE37744@collabora.com>
References: <20260202-io-v1-0-9bb2177d23be@nvidia.com>
 <20260202-io-v1-1-9bb2177d23be@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
