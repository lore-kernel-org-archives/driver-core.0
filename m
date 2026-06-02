Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C86018787A;
	Tue,  2 Jun 2026 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408381; cv=none; b=mg9Fr+6E/jZ3/J7SRLFde4hqWOzLoJAIPEydL8DkHgd5o1Hn3DmNeqhPyNoXFNoOMSYlolAWVIIN9B2/YW6yana1gjNXnfb1fsbvifsDVRmqLkJaO7VmnGXdoBoOP1GO3mDPuXbOuZDi0AShXCDGYfQ7GckpgPfm5eKfscPi/lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408381; c=relaxed/simple;
	bh=UQkSJxHfn9SG4LHqNcjBHjz+wUwjrTsUkmTkXLRPFu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCckpqXHqpc2N44DB+VE1Md1hBP8u2AaO0cgXMSez1Ur/4j0965hhuWBvqUZhXCAgAW2XVXjxK9/fMfUBwyDwrSSEXC8tFUqwtWAGa9DE4d8Y/vH8u7a0EABUTptytTPAFgWMBHzz6IoBjJtPwuRK/Qe2v4UsZQ+DheXsl9LDy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkHIoSjZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkHIoSjZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D7A1F00893;
	Tue,  2 Jun 2026 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780408380;
	bh=z1tHV5PFyntV4MsgcFI0Yj3Eih7tGuVYlnTYKRafrpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YkHIoSjZ6gySuWhmNlSPQM9HaM33hJGZMjr1UpRQ1Ew1X7VqTmia6F1Vuma3oWmS4
	 bHpLZ68k5cKECeJrKBfk67GeusEpfJ1cuY9odS/OomW2qrpmrDQKHIqtcDqYU9qnmD
	 oiZblN/IzgaKs57BSKAhZi6vfmNdmNs07dooG4ZSU9diVDU776V1O+K5teD8LB/fOZ
	 T3pWug6hMigDNs4okAO6mL6aEsL9jXIvPRxyWHNfxTxaTtVQ9DCNStlM1GMNNXybfb
	 8+Vwu7iXLO3wuyKRYdC4AEBlFieS0zC/ZkcRwdjVUaLuIODvqomnl6tmJwzP/7jFtu
	 IPlblL+wh0FLw==
From: Danilo Krummrich <dakr@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Zhang Yuwei <zhangyuwei20@huawei.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Tejun Heo <tj@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: Use system_percpu_wq instead of system_wq
Date: Tue,  2 Jun 2026 15:52:55 +0200
Message-ID: <20260602135255.1327986-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601-driver-core-fix-system_wq-warning-v1-1-f9001a70ee25@kernel.org>
References: <20260601-driver-core-fix-system_wq-warning-v1-1-f9001a70ee25@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 01 Jun 2026 20:56:31 -0700, Nathan Chancellor wrote:
> [PATCH] driver core: Use system_percpu_wq instead of system_wq

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: Use system_percpu_wq instead of system_wq
      commit: fda8355f13ea

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
