Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE7F78F2F;
	Mon, 16 Feb 2026 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771248146; cv=none; b=q7ohEDkToyPW4VCwUdKhLyf7oUFVtPvcXp3d5u2YXXrLO+D3pv7CsE1+zRS9zO0sHvFCzk57toZw/DP8jyIcuIy7O7Z/0djO+pYix2uidBIX8BY773QZKkvU1F5GXLI/WeQeonW6UHgOlH+VspZOuj9BCVXUqTiJ/xpPNoYu3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771248146; c=relaxed/simple;
	bh=wq+Zr6L88Web7nSkY4eKcKCq9RujjgnqldokSx/qmRA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=b6DtbRY4RoqP7POQVFiCl45AeEkvBH3rZrzAC17B8mAun8qy58GDAwuyfJ9hnQl4Lfg2Zt9tk+WnDr4FyQ0n5ea3gmaJL+lMbpk4Er0ovL4L3dy2YBGCvpGG8N2UymtvZElddp3fnCIMcSye+bhP+oHnFy/mFy+9+f8ZTj4G5Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frRDEktT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frRDEktT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8765CC116C6;
	Mon, 16 Feb 2026 13:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771248146;
	bh=wq+Zr6L88Web7nSkY4eKcKCq9RujjgnqldokSx/qmRA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=frRDEktTVlJUto0BcqBtYAJGbVuzLzbUuaBjm/ndTovt7+86WajDsEmpOaJoX7xAK
	 xTuwIxVxoQlu5fSVLLaaHyXm2GDSE/HyLg2wrKJDxDzpaasnXFZ2FVOH248N/z6uMI
	 0wNjy2OX1hksnkGA2pvBOU/GUcP6A3k5S3lERUUJ9EAqnN23B1t09kzEL2gxgHHUl2
	 LlFtWvMTOg8qwCAEOmPYl1B2EKR7tk/AqnFSLM5hr9/RedmP4Q6TTomHQYX57FzzaH
	 g57X2Our9caSrPyL3BzddhAwD3BftWxAdtsR70fIQcoup19/YNrBB6YL5gq1utdI0L
	 +Lz7BIEH9Jt6g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 14:22:22 +0100
Message-Id: <DGGF2BKJP4BS.1CZFWVQTK144G@kernel.org>
Subject: Re: Mainline UML Rust stable io.rs unused imports
Cc: "David Gow" <davidgow@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Richard Weinberger"
 <richard@nod.at>, "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, <driver-core@lists.linux.dev>,
 "linux-um" <linux-um@lists.infradead.org>, "rust-for-linux"
 <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <CANiq72khOYkt6t5zwMvSiyZvWWHMZuNCMERXu=7K=_5tT-8Pgg@mail.gmail.com> <DGGBI4DU4J4U.2JOBHL5IFUCTL@kernel.org>
In-Reply-To: <DGGBI4DU4J4U.2JOBHL5IFUCTL@kernel.org>

On Mon Feb 16, 2026 at 11:34 AM CET, Danilo Krummrich wrote:
> I will send a fix soon.

https://lore.kernel.org/driver-core/20260216131534.65008-1-dakr@kernel.org/
