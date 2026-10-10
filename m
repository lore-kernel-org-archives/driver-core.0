Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6275F347BBD
	for <driver-core@lists.linux.dev>; Sat, 10 Oct 2026 19:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791660855; cv=pass; b=TJsMXOiwuSbZIdtFlihARtAe4XcaJAJ4XwxWnRWShnT/Ht9yU1wJOGD07SJ/Fn1VejUU8417JUV/Rjvp2BnobHlG4FUxiuUGlJCvUGbR1l4QF/B+/OvuqnKjuoHQenzS88pXV4xyImlSp6kyMNbYS5Y46khTlEqgQg0bqwFEyn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791660855; c=relaxed/simple;
	bh=xKOMNbBD2XUtcjO+YDJeWH9ULZS/70L3GDSQ/QcsZB4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=W9GuDAbjFn3cGVPNRKoaeleT150x2rYJJVhaZZJEEqgh10jGQFDCAOAtvHKHn+RYOy/wv6KW8hnafjLSNFPw4RGBoXlnf4jDGbsESlbn2EpLsLc5c5vNGFP4/Ei0x7gL6PL+8ilY+0vkYQFijmw4QFe8h6b/Yhx4YUegwe8FR7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=a/y+EOXT; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="a/y+EOXT"
ARC-Seal: i=1; a=rsa-sha256; t=1791660833; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NGtw313ThYAUgnS/n8XOc/ay1UJa5UFJLVSh+7JkLdwwTMCtuLUp/iiXRNMby159dLvL+n7YOyonx3m6eHiJlA1WTSrXcwNRUTxiXn7hbRVj7F+OG0CLJ8SYvhSHbgMbKYQ3fi6f6m0pZz1VhzMhayqppAyJtb4yscR+1fc7614=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791660833; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DwjZ8HoirsbhBHMOLTlle3+6cKbWORhpDE5jw/lvyr0=; 
	b=DoLrpV8+Sy9ppjAYAmEdzZpqRKlGjW3v5W44GJb6L6fLA9K9wX0fm1g1D0VAAoIE8XHBFm/rpIhbxrcAQmv+yzALVQQFfZDC57+oP4K/T3hwnn4eLDbi2CKBSJJ9VMHuNbTeIMgI7xoxOANvzfAblNsfe5KmVPJ1bFyz43oqGEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791660833;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=DwjZ8HoirsbhBHMOLTlle3+6cKbWORhpDE5jw/lvyr0=;
	b=a/y+EOXTa1LV1bC3hn0jRDa1LPAg4Q63p6uzODb3LPbS5Me3kavOP3IGKbgC8zBL
	jMmEtV6dR/JhOL+leXHTsi6vlcju4ogCsj3X/g/q8Nqzbb/JmqcpzlQOu1FgyhP/TZg
	1uSAh3VS+eXkibadAp7HueteUna1Lr1nb3d3COWQ=
Received: by smtp.zohomail.com with SMTPS id 1791660831468655.5458899578292;
	Sat, 10 Oct 2026 12:33:51 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v3 04/11] drm/tyr: add per-file VM pool
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aspyoBHaSaJpMxJv@um790>
Date: Sat, 10 Oct 2026 16:33:32 -0300
Cc: Ke Sun <sunke@kylinos.cn>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 rust-for-linux@vger.kernel.org,
 linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev,
 Alvin Sun <alvin.sun@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B20D93F5-4950-4E9C-8E3B-E2DC476DA539@collabora.com>
References: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
 <20260929-tyr-ioctls-v3-4-26955fb111d5@kylinos.cn> <aspyoBHaSaJpMxJv@um790>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Hi Deb,

I find it unidiomatic to have containers destroy an item if addition =
fails. A
more common pattern is to return the item in an error. Something like:

pub(crate) struct AddError<'drm> {
    pub(crate) error: Error,
    pub(crate) vm: Arc<Vm<'drm>>,
}

This would not convert automatically to Error, so callers could not =
simply "?"
it, they have to handle it:

pool.add(vm).map_err(|e| {
    e.vm.kill();
    e.error
})?;

Don't worry, I plan to remove the need to manually call kill() soon, so =
this
subject will become outdated in the near future.

Paths where the Vm is already in the pool can call kill() though, this =
includes
remove().

-- Daniel=
