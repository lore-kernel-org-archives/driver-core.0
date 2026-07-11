Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E6303C87;
	Sat, 11 Jul 2026 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783814245; cv=none; b=nylGXmBvkhppSs8FXrBnDBX4dhHGFuhkH5fM7BhEQCV0zdLMMXgPiTOSwcI4RtZHTJJHUBPxtTWSVjLNpTDvF+nhoMJnol3xm5tA/3Tff++HAdWPLulw9P2oTGNMHlTNnTFUcSrPE/2hUbA1NnQYaQ4I6Ll05gbZYY/xA8XkfVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783814245; c=relaxed/simple;
	bh=TOcafgcPb9Mkhua90rvKOGXtW8w6dkJXDUJBpktI1tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0UH78Zfei84fafKzMsonpnX6zhe4NvboUA+Pga8nbjjeW7kze+oOkZgzIHnbCge0oHeswHGIo72eO6thQVSzkTul23GceDtqaP5r018SBiqIVq32wjJLikEYwEniD5aWK7Z7NdSzPIyX6O/XhNBKkcF5k90rly4qGui1cfusNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCvlbi3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCvlbi3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA8F1F000E9;
	Sat, 11 Jul 2026 23:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783814244;
	bh=SV6kOZKN8Cz/MNuqHNMXnB9KS1bakeG1KEqjyHHuric=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QCvlbi3HnVRYWRDmXCiL6sBRIRj9WBnB0fI+/x8h02ekD7U30gBkoaWK5GWopuA6S
	 tRyteN/KVsO/3+OSebaqM9I4U/sZRJqe/OuDc2ZsYZfu2H34fs2NI9aYg58aUWmjaQ
	 33hXhMoRuIK+VSvUZuw9+3eMbhKxKQGouHwhdyqJMCqTa14Q6f8tlGT4ksYmpgyWKH
	 UldoYuJMplRwyzXzMNV54fulalUoXE4Oys96FG46u4l23PXV8W57YyhWoAT5GsGzqk
	 EiW9ME36/vtLHSHNM8SV45l8e6faoZT3IdjjIi9QDvUnrb4fzVUueW66cVg7MVHDr6
	 obgaFcA72XbjA==
From: Danilo Krummrich <dakr@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] firmware_loader: builtin: ignore 0-size firmware
Date: Sun, 12 Jul 2026 01:57:19 +0200
Message-ID: <20260711235719.734497-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
References: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 25 Apr 2026 21:30:38 -0700, Dmitry Torokhov wrote:
> [PATCH 1/2] firmware_loader: builtin: ignore 0-size firmware

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] firmware_loader: builtin: ignore 0-size firmware
      commit: d059966c0c7d

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
