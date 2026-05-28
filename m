Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E520F29B781;
	Thu, 28 May 2026 23:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009808; cv=none; b=qoBuPPR6CcK+exkfMxSNT6vSeGVUFoHx+e9Fug8x4xLmifdH5MdTvr18YbJX4ZSqXwyyI386R/wareLbRXwN2AfrZ8odHMerRtdPFArciy1bmSwBJO7qkHrcX63fr4jaBwHzvoENPbomXrKmaumj/6jx154sdhokP76yal/7aC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009808; c=relaxed/simple;
	bh=9LP0QLM69aPKp1pf7AkStTgT46yv7pJoK/Jy+fqreSw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=TfoUk8ts5u1M5Be1cb9lJXMAwvNJpGRVIeFShxCFpkIOYLzfYxaorQtrhzolfhZgeO7rZLrL6QVOo/ft/T/uDCAKgul0MCon+Py7sb+MCurjGP9LkfMuz0fnsuk512mQy/A02v3Sz0O+HDhM+KEv9BXqZusP5JNp3dUgewaQhzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1I53B0p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1I53B0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF381F000E9;
	Thu, 28 May 2026 23:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780009807;
	bh=9LP0QLM69aPKp1pf7AkStTgT46yv7pJoK/Jy+fqreSw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=J1I53B0pX4A4Ry7I/eSVar0qwZDRyAiS8jyXPVK7yFwIZupFQfxkNDIKaQhMecE3U
	 zTNJtHPIQROvh7n4F8gsbMqgqFdTv22Gni7O3FKKh+1WNBQH8mth/1qQnaIBK+Hjet
	 4FaVkM4PYXJp2XbFjA7KofuQIIg7nHU+M4e43C8wt+krfDdX1sfgIo7O2FxU3Vpzk9
	 VRpVat5MrIaoJNxXBfjRDVgHVwRLXjtIFixEMfyaLIV/3wxkoafH9PQnpA5QIusEVZ
	 qIwTwE033mIAHgIC4QbT/Pde759Ezl85hMKX9sSLtZoRVyV12mHViA56LRICM2TpCx
	 tt1jRjdPizveg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 01:10:03 +0200
Message-Id: <DIUOTAW08FNU.3SKDC8AIZUWBZ@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
References: <20260526000447.350558-1-dakr@kernel.org>
 <DITJFWVQH4ZF.1HYM0UDBMWQ2J@garyguo.net>
 <DITNP59XG4H8.VYHNILHQV05G@kernel.org>
 <DITNR1QTIE1L.3MTG2UJJVGFAK@garyguo.net>
 <DITNW1LVAJ16.2V0QUI6JAGKBN@kernel.org>
 <DITPEZ9TLM8F.3I808DKPCW4LM@garyguo.net>
 <DITPXJNEU74Q.2D56FQAAITBVG@kernel.org>
In-Reply-To: <DITPXJNEU74Q.2D56FQAAITBVG@kernel.org>

On Wed May 27, 2026 at 9:49 PM CEST, Danilo Krummrich wrote:
> That said if you feel strongly about it, I don't mind moving the 'static =
bound
> to new() too much.

Keeping the bound on the struct for now, given that we agree to move it if =
it
creeps to more places off-list.
