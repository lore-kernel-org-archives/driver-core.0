Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106033126C0;
	Tue,  1 Sep 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279481; cv=none; b=ryNdGNnMwAjvTf0I/jYCZ0r3FNP1684SoWEa2HIX3bdAUDdN6y8hihXjibL5URiv8c0HPxXpUACmE4/X75qcb+IyQ0JPGPRH3NrMPcaqSLg/VebY+D5FwAr+FgRxV/4oTPrJ0RUaJK7unvjWZ0eG6AEZA8VI8tLNRUPfCoY61+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279481; c=relaxed/simple;
	bh=8Pg577gc3r0aEP/y6cxvLcTLPOFBDSSBNcvmC9jkDE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CpD1rR1JDazE0fPms4isF66uCOc+6ZyGc6mrZst1AHRWtso4a0ckasmqoL3fG40fnpw2OX+t6l4fq3TqAepc5nEWBNJmCFptYhOcftSvC89IP3SFLsJXkj1tzUnQ75/zJQnOdKSxpS92EZa81qarD3lzz59tH10pgc/gmqxtnlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXu9AT0S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXu9AT0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215D51F000E9;
	Tue,  1 Sep 2026 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279480;
	bh=YRN7Mo6SjXg4RmBZ3bYocXLlcPOHBTUX0o9VFOAIX34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZXu9AT0SY6KBOKUIu63vLeJUJ/DzI6gowO7RrUhbGTDzJoblfndqXVXxh/d4NRvvW
	 GvfwHL5KMeeIkqe2gAr6HcPger4wxFnndk9QV1LdK3TvhBcvFdkt4DZYcuG3DYC66L
	 KTOtC+Iwl8ZgpNUpjL9qoPfKdvvgzzXRGuyvcuW6uasug9a38CI07KxT6dVXUtptNs
	 YKuStyqMwlPKgh48ntDkiz9vM3gC9eEIYk9C4NFICFMJARaVbHWi9n+nSUpPy9NiI3
	 n1Y3DZEMszOgjkQFNs9lLrgCQfwCnlYhW/4mEFgK/HsDV53MjNMEkj2Q0GBviGHYDT
	 rHt/kRLcgt/xQ==
From: Danilo Krummrich <dakr@kernel.org>
To: hengyul@cs.unc.edu
Cc: chenyichong@uniontech.com,
	tj@kernel.org,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kernfs: preserve security xattrs without allocating iattrs
Date: Tue,  1 Sep 2026 18:17:56 +0200
Message-ID: <20260901161756.1292642-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822051705.1761850-1-hengyul@cs.unc.edu>
References: <20260822051705.1761850-1-hengyul@cs.unc.edu>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 22 Aug 2026 01:17:05 -0400, hengyul@cs.unc.edu wrote:
> [PATCH v2] kernfs: preserve security xattrs without allocating iattrs

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] kernfs: preserve security xattrs without allocating iattrs
      commit: 7b15d6cf25e6

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
