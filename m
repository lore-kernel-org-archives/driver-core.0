Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A19146D2B5;
	Thu,  1 Oct 2026 22:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892930; cv=none; b=mqssE5U/5oXIxobv+biJWNVb3V6Eq4Y05rIbAen3eyCvq8bm5oz0WqA3sumhg21SJumGdTnQfNRMLdZQD3PIzsfRqxXTFDl25OVnyiMkIRMOUjurPJwGE+Y814cW8XnTQ2lCLu48dwVvU56EvWZB6n/me5UHYIMcqI/FhfLqKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892930; c=relaxed/simple;
	bh=F9jPNPsOT1DFc64woebCRc28GgBP8QRZ/KeqCyrI0k4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R+jkCCX9z4HSD2ECpEVKRYlDWRVya1I+nSf5cn6fcoCYVxje5aTS9QMvhLnhRexRRIf4uulRKmbyGH7ow0g2JbbC/eXb72IxEDJ9Kvuf2UejqwVdGJkjSSZ9n1ahB8PebdbB+YQb69i3XlnYfkk1OBTOEnfJoFhXI/gpPedoltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUl0CxW/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUl0CxW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143191F000FF;
	Thu,  1 Oct 2026 22:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790892928;
	bh=NAhv9wxrC8g2egKWlW7N85bHFAS2i3TPhgTSaxR5TtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RUl0CxW/BxWnm7UNf6fb6I8spN+PZOGpyR5ACx5T5P0QsTG2S1MckTYwtXnt5jUwV
	 rI1099RTbxU7MF3xZnFAPMU7L7Y2iLY2hLiNwHw7TIZ9kMaeT57vIcdZS8HH4eOXTJ
	 cyu0CDahrTN3+v8VcDLAMwMFbkldxFWLpbGnqF12uMjqZxEGGIKR8qexh9Wug94MqI
	 sErW4tHGtbulHyesYc7QO+aYkY/zhwY6xoHRPpcABZBGe1XDw3N1jfIvtzf2mI5Nsp
	 pOMpDUuZpuBac2OX4M15+JW/WlbQm2ouq2bs/EO/k+QYuL3LLpQuJdhi6TnMt6OPGi
	 bKOn8z2rgCW3g==
From: Danilo Krummrich <dakr@kernel.org>
To: Lorenzo Delgado <lnsdev@proton.me>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/2] rust: io: convert ResourceSize into a transparent newtype
Date: Fri,  2 Oct 2026 00:15:20 +0200
Message-ID: <20261001221520.2989982-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927-resource-size-newtype-v4-0-447a08af23fb@proton.me>
References: <20260927-resource-size-newtype-v4-0-447a08af23fb@proton.me>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 27 Sep 2026 18:11:31 +0000, Lorenzo Delgado wrote:
> [PATCH v4 0/2] rust: io: convert ResourceSize into a transparent newtype

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] rust: scatterlist: return u32 from SGEntry::dma_len()
      commit: 2581f023a5a6
[2/2] rust: io: convert ResourceSize into a transparent newtype
      commit: 7db73c69c831

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
