Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4C3939A9;
	Mon,  7 Sep 2026 20:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814198; cv=none; b=HOVJqOD6nCuoq/Hrsu29ANE/vH/yhHBZQetiXcBgFV2FAHl4dMcA62NxnQ4yrN1lV1mpdPQtGQXlnarpD5TMMdYVYO5OopLGxzuGo90EblOkYpvMGCQ+rkXadicddMLGVWsuCiKjTfo8eci4rlV/ley6OrudgwTfSnypFckT0WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814198; c=relaxed/simple;
	bh=J8FpCVGnSx9b966efow95hj11vmznk9UzF065rFOfow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9rM5jy+A7Ot/DAn/poLMwg2KIeV0xGQpJyfjaicek0FCoxdcbbTBnKX/4rgXQKAMf5j1PtGV1pCOfEVEUt+H5F5RwMmeYW2p585PDSuF8Q019prILnEi8joXv/2G919DWwyjCCDazfy0R9L1uZvkh5SFID59//7ujXGax3nR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbFfogPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbFfogPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7951F00A3A;
	Mon,  7 Sep 2026 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788814197;
	bh=oYYECABPoDtBTOwvz59BoaO22gUwWREnK+6nh3tyNT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mbFfogPQJ6btxIZDR+rOcxb9Nc5JixT2mmcmiDMVArPov4NdZp0ccu4ORPWJezN0M
	 N/PC21iYHYDvUDPRs/IYW2IMtvbJ7a1pfpgn4zbPnJuvEGiBsbbEH+aogQGNgXyh1G
	 2MOomnS/eLR4HShSfdGWVDl5DSO8StoVq1UFJMVp45aborGrlxjjcQJaxnHjXRii5t
	 U5UHCmsoye/w45wevfqDX98mlFW5i2DgHdAdFaq/9n9w3TwltHaANxNAbuaw/JPi+n
	 j4XYeZ8zciJZz33eF1K9vmt+gWORpkdzcFwYrDlktTegBfMDiQz+MdojdM9uaoOQ2i
	 KRormUBiHsKHA==
From: Danilo Krummrich <dakr@kernel.org>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Keith Busch <kbusch@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drivers/base/node: fix UAF on device_register() failure
Date: Mon,  7 Sep 2026 22:49:53 +0200
Message-ID: <20260907204953.3762051-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907024732.1452228-1-gonglinkai@kylinos.cn>
References: <20260907024732.1452228-1-gonglinkai@kylinos.cn>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon,  7 Sep 2026 10:47:32 +0800, Linkai Gong wrote:
> [PATCH v3] drivers/base/node: fix UAF on device_register() failure

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] drivers/base/node: fix UAF on device_register() failure
      commit: 6d7e9bc51d8f

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
