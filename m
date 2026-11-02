Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579884;
	b=yFaGQLrsEqu/wYhLuc4vCpbwD2oDQC4znGP4eFri8PcjBaxWc0ZT2wQ9pSk1wLi/1DMx
	 lRuqjZ7GTg8QIBdmNl0FJ/XmdGUqOtNvuFQUfvikbcz4hfdZDCjG12V0tjV3ntIfB9tkX
	 55LF/FcEv+fktOw42fa/YoD0uaN0KsWg3dWsx2E8t2BYPncMD5hd0gOiPRi61BmC8x775
	 8vfD6HKhUsX3AqDhQBxK+IfdDizc3y7H/HRGAXstmiV2yYbBHPVI/wyoFhfh85aR/tM1t
	 zF8cxAFeN0Ndu7PHXsOPeauhNV9TO6miO/XHRWrheFMIucaQSxPo6M0t8CQhdw4TTkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579884;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rgtpykiDzIuOqTivLpzSza3dMV2uyRBpM5Ph9EsRBzY=;
	b=Inx2r8F0yIrOXMOVDG/9sqV34TLKMgFC73k4FoEppiHENeoWYqenwjQLHBHQ3vTyBCce
	 cssoYFoq2Q/U+ESwhbMYdBe5N2zSH8zaSku7gyk2aUKubplOHPwQQwRIKxII/OwLEESZF
	 Igjm28b1LUBom33/6Gw1KF//nllVFgKbSK0V802X2C6/foQEOUTIJQKLhXK7D9DuRtsCV
	 k21grKcQZO0bPN7y8FTY/1qMqeoslb5x/BCdYl52vUCpax412ACWrmXASAso7DGt2NIot
	 Av0oWUAPxLmy1iYxrhDHmV3eF6Ees5OLY83nwNlSVpE0stD1HH/ELcz+dLiPLQEtlUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jyox2rcn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F0A606A326;
	Mon,  2 Nov 2026 00:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jyox2rcn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC83E1F000C1;
	Mon,  2 Nov 2026 00:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793579883;
	bh=rgtpykiDzIuOqTivLpzSza3dMV2uyRBpM5Ph9EsRBzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jyox2rcnTfKBeViOjbzltvoaOYdnUDgQEdc0QiePG17GoccO0BHP7eqYkiCmAHpcJ
	 68a4o/azWWAnFOIdesVDZh7WW6Rs97ayeCGXTr5FgpjFEUDWtBn+epmieFKr1z8G70
	 TlIG3y3vkjDCFnPFfZcftQY1vRO0ZvkK9a2GVq3Ml4R36B6HbZxXFNrirCa3sQ5bnn
	 /kylF1Bt24DaTv9lIXDQcaLwkqNNEIooLE5+QrzLDEAESts9c5IRU4/2xykUfsWsg8
	 q4nDYubDT2FMza6HA4SodQ0/JR0Xrji1qvf5I6BbQbbnuHeY49ZEpMTpd6H50jdwtz
	 BM7TrZQEOkHVQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Meta kernel team <kernel-team@meta.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] kernfs: avoid READ_ONCE() on a kgid_t in kernfs_new_node()
Date: Mon,  2 Nov 2026 01:37:59 +0100
Message-ID: <20261102003759.2527414-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027143247.3537239-1-shakeel.butt@linux.dev>
References: <20261027143247.3537239-1-shakeel.butt@linux.dev>
X-Patch-Reply: applied
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 27 Oct 2026 07:32:47 -0700, Shakeel Butt wrote:
> [PATCH] kernfs: avoid READ_ONCE() on a kgid_t in kernfs_new_node()

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] kernfs: avoid READ_ONCE() on a kgid_t in kernfs_new_node()
      commit: ef179363b043

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
