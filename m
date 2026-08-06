Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB78926C3BD;
	Thu,  6 Aug 2026 00:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785975174; cv=none; b=iwJn9DmfSithb/2NEVDjDUSqpLLjiKq3preaVn0+EqwfJlntwBidYJNosl9ghlE7UL9PvDcBZR2WkPqqGuz35dDb7+9TJO9WZfASNjY07mCThB6IigxVczNkd8pp17Y2hCFFtGupgpYjZruxD6aIpOlJ6l1Brv0cO3Kw0sMdHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785975174; c=relaxed/simple;
	bh=Cgy+RnO3bTkvrGbychnDMXBZNu+7GYnhAHyL9/L6F3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLuAN3yYFJcgvqtM5qcE1sGZCz6Uszvmb5aNsqvR3IeAkd/Mr8zIozmDjtdDgVhyrUntF84lwzOncLz3FOCAmf72kJmAswlj95VcTTMeCRN6IW5d4Lu3gJXyAO/9f8iHDqEDTBGrJhKShTMRJokEFRN/t8YWb5YICJi95FbhipE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRJLTyHc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRJLTyHc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108B11F000E9;
	Thu,  6 Aug 2026 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785975173;
	bh=oHj5gm7mBnp4Yq4Le8hJRYzxkoHyagURN4jCk1R4UpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BRJLTyHcbXlPXHGZKaq40CNS5IgSvIYt96EIeyUy8sHmH9a8SBZmxfPykSpbi3qEX
	 WWSV4TgSEfO3NzIu8gHepxEZ2fvFD3zKmtN7c10eUtNbTy+fC9OD/Fa5hq96TUCHc7
	 xCGQ7TLp9f/z6YwmT1S3+JojRi8WcLspzmQxS1NYxGKzKtFMM0uZQgC1thXkpfCyw2
	 eJilHSobxSDnkC2YE0ETSK5wkOIdzRzovqTLXIF1QESJjKWKOjYD4xcZMmxJz0lUMV
	 BNuAaCNJh7q6ATOPG8wviWTJiOGt9ZwP6666cE5Snxvo6hTzGi/kiUAVeBxHbf6bW9
	 Pug44hFbgFt3A==
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	zhiw@nvidia.com,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev
Subject: Re: [PATCH v7 0/8] Transition Nova Core to TLV firmware images
Date: Thu,  6 Aug 2026 02:12:48 +0200
Message-ID: <20260806001248.2279964-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731201017.2580713-1-ttabi@nvidia.com>
References: <20260731201017.2580713-1-ttabi@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 31 Jul 2026 15:10:09 -0500, Timur Tabi wrote:
> [PATCH v7 0/8] Transition Nova Core to TLV firmware images

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/8] rust: alloc: add Vec::zeroed method
      commit: 60782beb112e
[2/8] rust: firmware: add request_into_buf()
      commit: e6c2c6265521

      [ Declare fw as *const to match the FFI out-parameter type and pass
        &raw mut directly, removing the redundant cast chain. - Danilo ]

[3/8] gpu: nova-core: add TLV parser for firmware files
      commit: 33f40117c0c5

      [ Drop unnecessary payload.is_empty() check in Tlv::new(), use EINVAL
        instead of ENODATA in Tlv::get_bytes() and add a corresponding TODO
        comment. - Danilo ]

[4/8] gpu: nova-core: transition booter to TLV images
      commit: ad5157827522
[5/8] gpu: nova-core: transition gsp to TLV images
      commit: ccdcefb71acd
[6/8] gpu: nova-core: transition gen_bootloader to TLV images
      commit: ebc053cf0b4c
[7/8] gpu: nova-core: transition fsp to TLV images
      commit: 08994a0f2936
[8/8] gpu: nova-core: update firmware module info for TLV images
      commit: 7923d0bc8ede

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
