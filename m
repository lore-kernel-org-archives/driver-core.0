Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE937A4BE;
	Fri, 27 Mar 2026 20:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645126; cv=none; b=Zcn/EqPJ4U9xDH3oKBqoXR3RnQ9eXWb7P8HIR3xcxKldvMGgKVjUEoVPq5fTpy5h201w7fwXjxsADJ4pCjki3pmmEDuZ9ZBAQGoxqdPr2I6HRPKGUb86LaUcdRuFxQpQ8MSPZcBgq4GkM/3hLt9OrLrZhyAWxnYNdH965XMNkYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645126; c=relaxed/simple;
	bh=XlLsEYpYc3Vn4BgPPTHxnqP+JoOWIUm9HXvlVN0npB8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FmmP7wo70viP82eZRMXF54JSOr0l4J1z/RuWDbJVkkN1Nta3sklpIYDpJ+qwnYE/eLqVHoTgIWqd8vmZMBJ5iNqtp9g5vmmd2Ec4bn4OGZ9HKmYM4oGudk/x8U2ljjO0iBlFXtgsQI3QHSvLaY8K3hO4Ezbq5nV/B9lxvRvhY3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1croIWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1croIWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92E5C2BC9E;
	Fri, 27 Mar 2026 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774645126;
	bh=XlLsEYpYc3Vn4BgPPTHxnqP+JoOWIUm9HXvlVN0npB8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=H1croIWxsEJ20G4Gy7O3hhhngoHXMBTUmNYSsKkKGmiV+t2lO72QbEHcVYKRfJDVM
	 Y035/OIt2XP2763dUGyjfa3ULjb6KOrYSZFaHBv9Vp3e0t5gp6DBCqIXgpKecOT12m
	 wEO3egtP7TTjNxyUcVeDtxb5ADFusrXREyuCXsBOuOcgOvzhs02kUVuiZA7TUVqcp/
	 pG58TmvQXwSrPRguQVYCfoujBFMM0+6OihTrREW1pIdy2Z8wwKpDQooLFuTp0ByYrx
	 cNBAqAvfg6ZeKl7I/1hyue2AcP5s8fHaX52JdPt0672z1h/aYsRGHZuX2uEgMCo+H4
	 icWnUDgHj01Kw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:58:41 +0100
Message-Id: <DHDV6XWT2WII.14MZGICR8SYIZ@kernel.org>
Subject: Re: [PATCH 3/3] gpu: nova-core: use sized array for GSP log buffers
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
To: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
 <20260325003921.3420-3-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-3-dakr@kernel.org>

On Wed Mar 25, 2026 at 1:39 AM CET, Danilo Krummrich wrote:
> Switch LogBuffer from Coherent<[u8]> (unsized) to
> Coherent<[u8; LOG_BUFFER_SIZE]> (sized). The buffer size is a
> compile-time constant (RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE), so a
> fixed-size array is more precise and avoids the need for the runtime
> length parameter of zeroed_slice().
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-next, thanks!
