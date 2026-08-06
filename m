Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CD63E1203;
	Thu,  6 Aug 2026 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052797; cv=none; b=ievPeMOUYddsu/j8jtlbNlp4ei04VRYdxNK30ZBhZGZFFCWJ1ea20Eluc+1bGeDyNOKdASkAahbfo5DoLCz84dIK2XvHrtqI/WBIs9/nQSdgXz27852aszwnu1Z+Rg6qHja7xmNkbjAE0R9YzeVnD4eZ+DZpFT/t7amUTlCMOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052797; c=relaxed/simple;
	bh=aj0kqCtYzmzTiWVk8eSKl2nBtfZARwavGTuHWMz4p4Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZUFFvgxYey4l0Ed0lKE7Zgbim7mrDQEK1eFoe+vBu2VIhT26pHR2cg8KphwliQjsAjUeIdEwcvVYlZ1KGcQ4WEeN/AVgzPzJxQ4j+0Em9Hia5SudoJIWZZgJRn4EUcnD5Xs8M96cxK8S1sDtGGYcosfTc2t1leEBRyQroAqShxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euDhVZe2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euDhVZe2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317531F000E9;
	Thu,  6 Aug 2026 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052795;
	bh=aj0kqCtYzmzTiWVk8eSKl2nBtfZARwavGTuHWMz4p4Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=euDhVZe2V0+fdLmFzBf2qn+nR4FOB7ZcxHQ0cmfIWSx2MmQ2ALbsCbA8Ac3rmfKRq
	 Ktn+qNJwB5w3fdMKO5YD4bDs9Xf/gzi++DmXvn5kNXRR6ML1l66yHkopYaS8K9dtZV
	 04x3kcpiagKzb3u/FuBLd28Jwv54lMFm1BIvhr7k4RPrWnTysnsPj0z916UGGadD+h
	 x1smlDLKu5+oZfxrGc+7TjwW+lxQvPdf6d/X6O+dzSBvr2aMJRmmojOo+V2B1ddEpT
	 RPws7xMmvou7dN94sEtdHdkrZjcNXa8CicqPHq1ipOi6ye8kW7WzxmuBja8L8lNi+7
	 zkJO9nEdx3gCg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 23:46:32 +0200
Message-Id: <DKI6VHVGQVRX.3JWQYO4QAPJC3@kernel.org>
Subject: Re: [PATCH v1] firmware_loader: Unwind initialization on sysfs
 failure
Cc: <mcgrof@kernel.org>, <russ.weight@linux.dev>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <nixiaoming@huawei.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Yuho Choi" <dbgh9129@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260803012941.610268-1-dbgh9129@gmail.com>
In-Reply-To: <20260803012941.610268-1-dbgh9129@gmail.com>

On Mon Aug 3, 2026 at 3:29 AM CEST, Yuho Choi wrote:
> firmware_class_init() leaves the firmware PM operations and reboot
> notifier registered when register_sysfs_loader() fails. In addition, the
> sysfs loader can leave the firmware class registered if its sysctl setup
> fails.

Those are two separate issues, so it should also be two separate patches.
