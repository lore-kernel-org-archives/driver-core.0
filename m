Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31FB40A924
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850776; cv=pass; b=BTlfufjbwlMrYrAxSN6Dg9zqEufVRY0Dq793i5gu1Tij4nEQ8htq7VFOg+jvJpAq7I+/BOHAfUuqz8WPHt4U/hRhgvdxDYipyweQKhupuA9uqLx4T9BrIvZUtTPDkiZZtoNIqmcJ8At0sTUMTunx9tvaWfImeQbnfp36VOQyqE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850776; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ouUZBKUOiMIMySj1xdhnRlk5jkzUMJist4QkL3M6TyTkDIiKscoAxdHVcaddV051rJM/3YJfocOTHVzGbOHDa2pqXEB6Pb2WNyOOOesv6P40gQlL3wADrR8RPJdaREagdENJ8/mAbZ3BQGyNTGdVAaKMurCdRjfv06QIE5NDiVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=P+EpakXE; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="P+EpakXE"
ARC-Seal: i=1; a=rsa-sha256; t=1787850768; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HcycDi3hJljK3APOIwayi5O48+vSg0AwaFBepVZtTYgbyGOlZw8oL3Ac2p2lW1pLC7baoWMPZbJhSUuhQ/k2wfqPj1dtuj20ryXFqX/56Nu+gvRJukEbl1LzG3hHnZFRsS7wz/yc3i5DmLC1ME3N1kadUsdirqfr93pcAKEqnlw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787850768; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=d7K40dlDkkzlkaGx+CCCpQgmPeUu9mVzKZT6JYP4iVPT4mfYtC1V86s4JhxKuY19PzKwh8j1o2/zhlIzjh0c9jQCGE6IZ8uwm2AIu49gOkQcq1pc2M5w2IfNjNAH4FrWthncVwUGzkhxvmu4x155y5o+Lf9Refkpxii1ds+BF+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787850768;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=P+EpakXE3+UTjPk/sC44yEcVMIDM5xqcK6ZhyGL7iOgX4y1C59iLQbwGCANB3VF3
	5OwdRO+pB2co6oLoVIwNL08sr1SWBg/2hh/ZhA63tkhiyY+GbvKllyPCpEje7cWjrRM
	yKvgmGQAXC9CTdPhBkYyAZVX115X9ODND4qb8CeA=
Received: by mx.zohomail.com with SMTPS id 1787850765413595.017308004113;
	Thu, 27 Aug 2026 10:12:45 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/6] rust: workqueue: replace deprecated system_wq with
 system_{percpu,dfl}_wq
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260807165252.3849875-2-dakr@kernel.org>
Date: Thu, 27 Aug 2026 14:12:23 -0300
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
Message-Id: <A0943F65-71A6-4E49-A586-A3387D09B5EC@collabora.com>
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-2-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
