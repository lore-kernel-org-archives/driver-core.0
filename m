Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F87136894D;
	Thu, 28 May 2026 23:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009840; cv=none; b=kJi66DDn5Je1ZKRCADgLs66+GV/llZa9yLA8agk9GvU4TCssstsbyDC553JUeh5RkwYO2gCFtyWYGDYKKxb9mVUVAK5p3NnhxE9XMOvV0QW3rN2im7GoRfC5QmK09HDcBJVpdS9NZHcdtZn5A9VuX5RCp+ZcjbxYCQNKO3bIflY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009840; c=relaxed/simple;
	bh=0nMZ4yHxVBlrd5e8Dg+WyKk8RJ3TFg9oP8hMGpME+44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mdSYyJwS74Z0jNlAathjm6KFKcALlk0bCxMb7b/+usGQzKKAy3WbTjvF1pnaAcKPG5Jb0t3Hn1biGgsfyJQfbkY8Df+NaeawgpCOUXsFcQPDE8aidcyxfa4hoo2Ni8gUGdun8yFERsykgx5K15RPjPZBQpxfjCxH7F/9Fk2OO7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jasw8d+R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jasw8d+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9731E1F000E9;
	Thu, 28 May 2026 23:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780009839;
	bh=R/tBOqyVGQgM7eBEDPWxlNEHz1ad4uDCbcOKrESu1N0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jasw8d+R2/VOB00imbnSRozm0g+qB+woTGQLJAsv94/cyCW6I0uO0jgXnx3mGu2C8
	 CLaeJLxFXaHa+56EN/mlJAzO/FYVS7enqQVKCzc6Pu3igBnL0s1Wx0i7TphYZ7lRy8
	 QLCd8p3fLVQEECRonQ5jBMfQEKOCfaR8nO81k+l/9QXd09wTAdUSArLuNdEtgqi5fT
	 aTxYBkl4NZZyrxYWe0aqlBpzDMOD4jkcflU2R3RqUABg/2EodSz7RvukA+eKoL7R2R
	 xvSiN2A8pdo0Nv5TvFcPzjVkZ9e+8H5NY7+Zr7/CV+uaDpt5g9w6YZc6GCx18J2gdp
	 5MHTymtYNrWzQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
Date: Fri, 29 May 2026 01:10:34 +0200
Message-ID: <20260528231034.2208765-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526000447.350558-1-dakr@kernel.org>
References: <20260526000447.350558-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 02:04:41 +0200, Danilo Krummrich wrote:
> [PATCH] rust: devres: add 'static bound to Devres<T>

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: devres: add 'static bound to Devres<T>
      commit: 016267b521b1

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
