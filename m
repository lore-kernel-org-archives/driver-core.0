Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486DF44AB91;
	Tue, 21 Jul 2026 21:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670251; cv=none; b=nRuKnbBrMbQsU4JSGgKspOX5cuxDr1q0qx/nGXZTdO0eRjGoEmTCHyhY9vMM8BErV0WEHqpJmuRE1iNlBcDlHtjGJBDhS0dEwIAs9EjrQILz2PNDEluSKHvIYsRD7a7I4+mljl2cBKKKQ5xUQx0Yvyuz8Logh3jrip+40/nzK7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670251; c=relaxed/simple;
	bh=KsM7zd9Fi88s8x44doaWs3Ka/jaVfDwadQ2JbX1udHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZRmCcsQwzbp18cqiVq5ZS/k/AgbYzMpHReIsLO2R4efat+mS/l6T9yabxu1HHJMgsPppfklfHq9kacepoPdt8CToiS0qWhYH3ZHe2aaAcANRSzC2C1fifm+JHtIATfqjlh3Nn86KLMXkQkI7DSaNHd2ZFwQ7P0JlC/bVHZ7OCK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cx6fw7m1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cx6fw7m1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959F91F000E9;
	Tue, 21 Jul 2026 21:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784670250;
	bh=ULUTZrr/mwVjHAfYwrIrYF0Hs/9CnYoc1OlSztfkaJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cx6fw7m1otOPbQUb+lf5Mn1DzCeaEKFApYin4n+pp6NADywfZfZCtUc/4cV2HrsOk
	 Y9hrBNlv5BwLHS1BCPugQE51/f6NK9Eb6VwMobDUw9z0uKMSTjmLfqxz3WviE4FORC
	 Tn+/Zxg14obo4Z487oxCDHbnM+wcqmSN1shLbfUG7ANV3u+sqU+lmcEGIj+vve509J
	 WyhPJtDu738HspyBTRdVNSEmtqAfaKUu9iHZAJhX/fgroE9CvcaMs86GYAxQyyDoQP
	 79eGaVoh6R+jYwLLFMdHDFFNjidaMQIwgEZq8eU84MKJl5hWq8usuz/ZH1CC93VDuZ
	 HNYEhY9fQYzqg==
From: Danilo Krummrich <dakr@kernel.org>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	andriy.shevchenko@linux.intel.com,
	bartosz.golaszewski@oss.qualcomm.com,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 0/2] device property: add test cases for fwnode_for_each_child_node()
Date: Tue, 21 Jul 2026 23:43:46 +0200
Message-ID: <20260721214344.1787957-3-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Jul 2026 18:54:46 +0800, Xu Yang wrote:=0D
> [PATCH v6 0/2] device property: add test cases for fwnode_for_each_child_=
node()=0D
=0D
Applied, thanks!=0D
=0D
  Branch: driver-core-testing=0D
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-=
core.git=0D
=0D
[1/2] of: kobj: export of_node_ktype for use by modules=0D
      commit: 08bc14983723=0D
=0D
      [ Add empty line before the kunit include. - Danilo ]=0D
=0D
[2/2] device property: add test cases for fwnode_for_each_child_node()=0D
      commit: 0e6f8ccd4618=0D
=0D
The patches will appear in the next linux-next integration (typically withi=
n 24=0D
hours on weekdays).=0D
=0D
The patches are in the driver-core-testing branch and will be promoted to=0D
driver-core-next after validation.=0D
