Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EC33A2E25
	for <driver-core@lists.linux.dev>; Thu, 24 Sep 2026 18:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275606; cv=none; b=iRlGUuc7qpD17qd6/JvPoXcsY6LYwwVqO0lRHfgnFXyVfNIZ6eqBdtnuAjDwmO+pCefTrb8jh8mw4j6nZMbarUVnVD72wicf2gk96sAonSGT9AhFg3Xbwe2kZGeyyiAULsFGm+VhItuMSFnGwrJILiDMDGB43iPhlXiPIIz5H+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275606; c=relaxed/simple;
	bh=iU/1kK6rGMZGigGxx0MD7+QM3Ta+H4Oeg5sJyrvQZGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9mhyp+PRwL+1FzBdeDA2S4Zwi+yo/b2Gp416o+eR4Oty3E6HM0lnzpFQLXIWdWsVb3zhQ6Geeu53KCnRNq5rrUeR23T6I4t+gs7rSqCoebb98Uyxc7dEXwDBoQ+n5cScE/yChXRT9AWp3SNH5u/UG1NfOVfMBbzSph7SQlVX2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuK21PZr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuK21PZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512FA1F000FF;
	Thu, 24 Sep 2026 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790275599;
	bh=GmUHnGloCECaSKt4LPX14wDKVZIYqGkDetTurMM/GIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RuK21PZrkoi96wQeew6LN+6REH6aZzy6NitDwLLIebfIlMy/xYGL//R11+I38T3eP
	 ZzY2DvBwSGVORHv7i/n1e8rJcMYBeuK5uo0RknnujA7VhCBqbcTq3a/pPTuwGbZFBv
	 BGT7c7Z00p7zQZ0vhxNOuwdO+NbhIKYnc72piYK7u1XHGpYLPs4m+RztwaB+w27PQw
	 l+gfhDQtlcLICowHPsvhbeDI3VelVVgSOokGEEo/avO7DKzM8B0b0pYsamHd2C6+xs
	 v+hZsLRn97t80++JxDfXLftfudO4djaUyd/iSY8B5jCbldHEG2Jpon0pqWtdjHCo5B
	 pBoaTCeB41hrg==
From: Danilo Krummrich <dakr@kernel.org>
To: Jiacheng Xu <stitch@zju.edu.cn>
Cc: gregkh@linuxfoundation.org,
	vishal.moola@gmail.com,
	rafael@kernel.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3] kobject: fix out-of-bounds access in kobject_action_type()
Date: Thu, 24 Sep 2026 20:46:34 +0200
Message-ID: <20260924184634.172746-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920053726.22626-1-stitch@zju.edu.cn>
References: <20260920053726.22626-1-stitch@zju.edu.cn>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 20 Sep 2026 13:37:26 +0800, Jiacheng Xu wrote:
> [PATCH v3] kobject: fix out-of-bounds access in kobject_action_type()

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] kobject: fix out-of-bounds access in kobject_action_type()
      commit: d516455c9405

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
