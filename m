Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C9480DF1;
	Thu,  6 Aug 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031949; cv=none; b=I4UtJ9Ns7tIj8RIoovrFrp/rhdCu4QukzdzEknn80LB+tTw8HuHmGdCCjNOwLXQtL4ec8uOVFy8hJgzad9KvDHZufHveU7tDKNSvhD3NPD2P7u9C4PKzTjVdgpUV+rAbbl76DuF1I1Q7DoajxwYm0uWsWiGPGOakhJXZEu/PGx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031949; c=relaxed/simple;
	bh=PyRX44TWbSQmH4DxAgf/LDyoWD0pTEsO0mexiGQYljY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l88oYOvn4eyvPDRm9T2++6+8NNedTAW8a5so+8UregbCKTM+TaFVKbx37i9SbwRqSoBNKsDwXUKQ6IXd5YrrE0m9qpeen14+sHgXJcDoIkevY2JhRKVRu3A02WNjrr0s1ZSOGh3k42r+r0ptBEZLbx/duc2ZFBrZ3DSubUAmn30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1XoyAAH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1XoyAAH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDE91F000E9;
	Thu,  6 Aug 2026 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786031939;
	bh=Se1YhzfVhyhYyv5xQi5B8z4QRc5zCTg27+p1qeUPHqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K1XoyAAH69RVlXltfOSzjdic5lzH+oktcgjlbA7vOGy2Q7x55Z2/LLew7wlJiZBpE
	 dHZJNiRgWjwMdr4fOScXG5gE5+bdSrQq9EItN73vVoYlz8FsShgqfzorB/KYhhxQEn
	 Nrm1tFkKKppnY4lncsJkAugFcnROGM75RNpHZAL+7GHPAWUrcyUSMWqN8K55o0htqq
	 HPIxTG8MP3ideDaR7Rbf7wtDoPfd8pALavRAn03XDy/ckEFV08ApNspDFK9O/s6tF9
	 kSjdGBt8mq7+0p8SlqJC2/JI2XhAQh32PFOKT9K8nr4qXBs0+hH+UWQG1XMgWJMo6u
	 bIn1uoE29ikPA==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	arnd@arndb.de,
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
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: io: gate ioremap/iounmap on CONFIG_HAS_IOMEM
Date: Thu,  6 Aug 2026 17:58:39 +0200
Message-ID: <20260806155838.2685758-2-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805212920.1996937-1-dakr@kernel.org>
References: <20260805212920.1996937-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed,  5 Aug 2026 23:28:35 +0200, Danilo Krummrich wrote:=0D
> [PATCH v2 1/2] rust: io: gate ioremap/iounmap on CONFIG_HAS_IOMEM=0D
=0D
Applied, thanks!=0D
=0D
  Branch: driver-core-linus=0D
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-=
core.git=0D
=0D
[1/2] rust: io: gate ioremap/iounmap on CONFIG_HAS_IOMEM=0D
      commit: 4f5f23846d67=0D
[2/2] rust: io: gate ioremap doctests on CONFIG_HAS_IOMEM=0D
      commit: f88db65aece9=0D
=0D
The patches will appear in the next linux-next integration (typically withi=
n 24=0D
hours on weekdays).=0D
=0D
The patches are queued up for Linus's tree and should land in the next -rc=
=0D
release.=0D
