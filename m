Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634174;
	b=Vt1KhFjTMwGvGqrwJEOeWHpAUIPbQDvcgFo3RkZUEU0+qqKcJvwtUhlN5r9MJt2S7hqN
	 SbdRWdu6W6m8rgNGIVRlCmEnAwO0WtohRltkwvwp8VhHcbUHGFczSsy1gGdTfogUyu02L
	 aimNHz7do/4C66cwF2jI0F4js5lMZ9eQXzFEoOfjfNzz1NwNHY/XEOT3bpWpRTBv/FY06
	 j7b6jDFUw9z729MyTbCUHbYuTlTOyEM2N5i85Lzx4/MPHvN8vR7oTlPEK2lXVlDqwpK8C
	 xoDMs4qC9GdBye4c4ReiL9iVsu8zGKnBiFTJLxd2E4raaTgDSCN7RW/YC/YNLZtc63g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634174;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PpGz1MQqBpSXu6o2JTgYCsEIk96VCC7rT4j96GbxFJk=;
	b=Oy2zyRJ37XQoVK6k/Ts7AWHpd6wiuS/T1bmNfgvFUklKPJ0OO3ZPzj77969SWNM6UWRO
	 SvUapJTaZQSbGrFsUvea2GbtHR6CcnZLBMALwHU3zEkvdw0xVtW0ufucS++34p/7xEPxh
	 KEJopFq9bZ/AUqjXOpiAW9PLPmdbV11FjstuWkRI1WS5jFpuTmyIaGVeTr75cn6IpceSG
	 OZlrh7hfLIU2EIAHo/PNFQ8FyqhO/IBO9uqBMW38JtrQ0SJBSuwsk8VuSc/jMKJQ1uKI2
	 oZG33d0gA3t/r/IyEfck4wp2UG01bU1iQhptyDwBoo6+ODMGt4BDHBhr3qImanrnsog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvnFSMvP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8A9606D809;
	Mon,  2 Nov 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvnFSMvP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EA71F00A16;
	Mon,  2 Nov 2026 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793634173;
	bh=PpGz1MQqBpSXu6o2JTgYCsEIk96VCC7rT4j96GbxFJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BvnFSMvPUax77IPcut4P5DO/5M7VXTin30Z0PI/PgIGmebALzfVeGLA+5T193bHTJ
	 Qe0kaDcs5LHgaCgZ/qU6qzfE+/OgzW3o/qHmssfTglSiq5jCkiGTOJXJHuaqg69z5i
	 aWe/XXA+blLORMW8RGIoFQwTYXCaXFzm5nv1Hjd1yj4HH6qHjiPzt4cEML7KtKbgtJ
	 yznBJcPghp9myKH1WQan0M0dFtAhFmaaccmc/r0LVU7DMyswsOwbRA8OJpv10yXlkN
	 MwNURpNMV7cjuPIQtqB2CwAk8rnNsbHjoP6GIEjOSMtZDbJ5WpMePSv53ARv56StE4
	 DxW9Kh5WsFhhQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update auxiliary bus entry
Date: Mon,  2 Nov 2026 16:42:44 +0100
Message-ID: <20261102154244.3093417-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102083218.1275785-1-johan@kernel.org>
References: <20261102083218.1275785-1-johan@kernel.org>
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

On Mon,  2 Nov 2026 09:32:18 +0100, Johan Hovold wrote:
> [PATCH] MAINTAINERS: update auxiliary bus entry

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] MAINTAINERS: update auxiliary bus entry
      commit: a42ae51fe3c3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
