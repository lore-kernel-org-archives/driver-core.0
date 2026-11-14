Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697441;
	b=I4dbern1hgtmiadx/jyk5e+sQ/1MJvTYULLxX4icslYz/x4v+rmZuYKcJh7x4qYEmZ6K
	 sHkuQxM8xaB6S5ka88XOCH9SrbPSVZxdOElLQ4qutJglpfh9ClS74q54BBt+fir9DBH+8
	 t30qU7iSrubUZy4ESFYmpRmc2NqYdKSiDNqJN4enHSmjH2FHJj9dHB4dQ4ilhLaszo/29
	 SpCN/IMT9GcdCiFbbm75L7P0fB/CxlXup+Fl9tVgIU+WfrXQjQpMdhxlDK0v1cFE4FuD7
	 lOIfCHoEyYGyBd+rf5QbUc5Zjy+n69wF1M3CNKl0fLr+PaQTWeTITrqoGFQ6KFyEg/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697441;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QtuooiMS1OqDWiaNmt4ze5BMMkwE/OOPpBPmfZV3iaM=;
	b=aQ4OozKLkVw8VZUEofL6oZpZw2Vnx/FpEvW/7XwPBGpVz0n1yFJB2c3n61ZBrG/t17ZE
	 28W+csOXfc6wSUyQcS+iqb6LAh3J/3Z/VvqcWxs5EPHSoMHwiK5xEyvC2WX+3VsrRGIAG
	 r54NG2HCET7dsmkEbDzAOUcvR0szw6BMtEI5POSXfAcYte/F2moUt7LsmZRQ3PXfGwIRV
	 glL/9/cwfe8KcbhY9gF6pcZR7Z2VDZMf5IGNCHl7sqQFl8kFswMwlF1HnGwqaf5w46BEK
	 kT/Er1i+Ec11cfjFx9MCxhWgZgAnWJmJEv4BFU17iTb6Y3g5KEbfTEedhF0HCakghMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIlacxBk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73C1606A329;
	Sat, 14 Nov 2026 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIlacxBk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EED1F000C4;
	Sat, 14 Nov 2026 23:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794697441;
	bh=QtuooiMS1OqDWiaNmt4ze5BMMkwE/OOPpBPmfZV3iaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MIlacxBk+9wAJx2cMVQ0QWUA7IhoZL13h1eWPLRIob3uZcmD9wKtc3sGByLeQb3vh
	 E5+mQ5n0tjgpSHhax5Z487W132vz+/7etz9KLsiteTlJbluyHFYx1cw37Yx9udWi0s
	 SJ4jf41FY6aVuIZSfK8Q0+C9BGSZoUvXiyTo9uSIxLmZIeyde3x2yupkYHd/vb8Lqd
	 /fFHtxFCyuwXq1iOBJMiT3s7c69qP9KZvXwcPXFheGLhtop5tsXC8QwQCN8kQsi9yM
	 nybztFfry44TzO+4sZhrfZM8p4/moZLQ3+KHaADlDvM476ZpG5ygZdiC1bv1h/KSrG
	 7yjuOUKLzLRSw==
From: Danilo Krummrich <dakr@kernel.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	lyude@redhat.com,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu
Subject: Re: [PATCH 1/1] rust: scatterlist: pin `Owned::sgt` to prevent invalidating `DmaMappedSgt::sgt`
Date: Sun, 15 Nov 2026 00:03:54 +0100
Message-ID: <20261114230354.15881-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <c8e4ab7f0f5417b53c3aed95169778e22afe7b06.1793652314.git.pgovind2@uci.edu>
References: <c8e4ab7f0f5417b53c3aed95169778e22afe7b06.1793652314.git.pgovind2@uci.edu>
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

On Wed, 11 Nov 2026 18:41:38 +0000, Priya Bala Govindasamy wrote:
> [PATCH 1/1] rust: scatterlist: pin `Owned::sgt` to prevent invalidating `DmaMappedSgt::sgt`

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: scatterlist: pin `Owned::sgt` to prevent invalidating `DmaMappedSgt::sgt`
      commit: 2268cf8e3d7b

      [ Move the pinning justification from the Send implementation to the
        DmaMappedSgt::new() callsite. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
