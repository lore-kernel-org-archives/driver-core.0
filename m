Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DB046A610
	for <driver-core@lists.linux.dev>; Wed, 23 Sep 2026 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196387; cv=pass; b=uj8UfJKaP/ETb7IgoYVn5yulVPew4BScIz3lRwXTjIMYyKftV20doPYUMHH6oBhquD3wJujnlvbqvd8N67ygziVtqOTmOP7DYPhy71BeZe5nf3YT7svN68zPBDjQuqft8yV+ASKjM8FIlKO7M0DWr7Nm3E4qbpRpiYiGnM1BGq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196387; c=relaxed/simple;
	bh=kAgF2g0UfI3sN2W1pEJziiLHeuJRudf8CGa6uz7bdY8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C1/e1Ss5Lu1PSh20gKMqiviV+CHqM8qo9+JhsKkBhzekqgrG01bO+04Y+8VOPYzfoYPuOn3FVQnS3FUuUin5uBcABgtHb9SL3EwkT+qRv7FNtWlAg3tE/rQQ6TRaJOLBO+BoTNECcI6CMJ0flNqzvjEDlbDcTY4FrR+AdY0EiT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=OVu5bhEQ; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="OVu5bhEQ"
ARC-Seal: i=1; a=rsa-sha256; t=1790196361; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZD9at1IpVlzlBeE/go+I66CNqaktVJ1OfMyx7UmC4WOcr0cKhugPY5B+vBYCd41vPoqI3olB//mLPAlC7YbwIzthxkz+f0lCNPXkGyKKcpgaIaL0s6kr7+vmr11K5EC2nQtOV3Yx5KP/zKgxN87fgQJNkLTC60fs0NduiXuefyI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790196361; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wnOjea9Ulf5NeEgYzIRVLFVysAiGNWc+4LJnVYwpa80=; 
	b=GS64NqTjsZI6RfPy/d4gLJ2RrUM+YTypROserIICal4l+dArxAamKaESZAQUXsQSAtkgZzukrX84tdH2W2JiIm1XaK3OKrWwR1S0aFoX/4vFwAQY7vsKkctaazpvWFjOl8zA9BA8DvbDmO85Yf8MqV2+RJZmqAHjB8XKkQIEfi4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790196361;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=wnOjea9Ulf5NeEgYzIRVLFVysAiGNWc+4LJnVYwpa80=;
	b=OVu5bhEQd08Gjph8Nz/TZFvDnsMdZlvHWxXkY2MPAHVUCZgwXg8ofB/5pjx010jS
	Tw9Akxblfgm3EdmiAdI+NApXkFVhz3wHSkGSeWiA+6XrAwkVmrB2sOU+hXTDtrvbb30
	tClMPrmtN2v6Ke+UCAHPcv4ssqYJ0pOYebEWMlIo=
Received: by smtp.zohomail.com with SMTPS id 1790196358937700.4388191159652;
	Wed, 23 Sep 2026 13:45:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH 5/9] drm/tyr: drop unused KernelBo::bo() function
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260915-tyr-interfaces-v1-5-5d28f1f75aca@collabora.com>
Date: Wed, 23 Sep 2026 17:45:39 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <0F19ABD7-1375-4559-A357-BCCEF91E0DD1@collabora.com>
References: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com>
 <20260915-tyr-interfaces-v1-5-5d28f1f75aca@collabora.com>
To: Laura Nao <laura.nao@collabora.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External



> On 15 Sep 2026, at 07:57, Laura Nao <laura.nao@collabora.com> wrote:
>=20
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
> drivers/gpu/drm/tyr/gem.rs | 4 ----
> 1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 6ae4e71d3cbf..9a75344acc3b 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -142,10 +142,6 @@ pub(crate) fn new(
>         })
>     }
>=20
> -    pub(crate) fn bo(&self) -> &Bo {
> -        &self.bo
> -    }
> -
>     /// Returns the GPU virtual address range occupied by this buffer.
>     pub(crate) fn va_range(&self) -> Range<u64> {
>         self.va_range.clone()
>=20
> --=20
> 2.39.5
>=20

Please squash into patch 3.

=E2=80=94 Daniel

