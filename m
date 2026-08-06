Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D3376A04;
	Thu,  6 Aug 2026 21:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052326; cv=none; b=omFZQhM+VD8hlRRH2KOIF6NmYlGcOwR8EeLT6BizZlTflMNP9fyzy0Fo5dd30iVTNnM7+aTRaVkV8K6jgBupd2vPuAwp4wXo3fq8dvKmElO+QurYpMJoInmNHV1evfs6bCMcOlGOL4hQMyiFgnvw4mh2nbXRqZHiJzCaVyLl8VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052326; c=relaxed/simple;
	bh=JPlTPyMBIeWmrgRn/ypWuZK/e/pqDuHtKaW7OqBQBcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcH4nT/9LSYLX7UIh4ST2pCy8/97YOz6T3eqXAFN0mB/VhWbahwL0kR8N/Zb9N/cnBuOdn2Xsj1i3iDCQNxtORO+CVx3whYrQ/F7gz20BAd3X/4XLHeL+l8Varp++AqXtYlko1rhhhJDXZ1veoXroHZsHiVCg97G453oGjwQfAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQBx8Upq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQBx8Upq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3BD1F000E9;
	Thu,  6 Aug 2026 21:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052324;
	bh=E4GUgwS7RXrskrQR743MRhxQtDL2RFd0paR3JffAdN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GQBx8UpqWxG/zdyOGr5ZzE26/OewHEiPH8BMv7taIYB8jdnv8dFBxOLOpNaQrN2hs
	 wNTsejgCzLcJVTXaE5obdVYgLxqqvlItTX0lJPzS0ddcbfngZaj4sQEjh0Bd7S5PXJ
	 9AuYyrYZhu6K8mcmHQPqwKB7dctk09lhPdhM1wznanYjck5UKtyEx9lcLuWDYgxaEe
	 iZ/+K1aMSxGx5035PsxNdK2bIi5CPEqK10HVbb8nTOn+19k3Hnzi0unsb0tSQKeOJh
	 U/nzCTSBsv9wtH07HhH4HjEUYNfYmB0mc5smV159fjddnFzjlQTzqd1PQkeZlE1z7h
	 ofZD5IeqoJJnw==
From: Danilo Krummrich <dakr@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Anirudh Rayabharam <mail@anirudhrb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware_loader: do not queue completed sysfs fallback requests
Date: Thu,  6 Aug 2026 23:38:40 +0200
Message-ID: <20260806213840.3143482-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716081601.1674470-1-mukesh.ojha@oss.qualcomm.com>
References: <20260716081601.1674470-1-mukesh.ojha@oss.qualcomm.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 16 Jul 2026 13:46:01 +0530, Mukesh Ojha wrote:
> [PATCH] firmware_loader: do not queue completed sysfs fallback requests

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] firmware_loader: do not queue completed sysfs fallback requests
      commit: b48373c90195

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
