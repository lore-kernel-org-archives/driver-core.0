Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C13312814;
	Sat, 26 Sep 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411376; cv=none; b=MZycGjshORUDDAVMlKNgtN4Qs4nMmWMV0+vJmK/1fqp3d93siGe9HY2nYKnbsW3/CEknRaN5T0p7tDutiebN4D7ib2d8tuwmOFp+21redLb6kuPPi0nJYXq54owQ2sjzWLrQGQab/xjJ/FQ2vwwFkTBmW2TITLrhfH32tVVpKbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411376; c=relaxed/simple;
	bh=hLqJQQ5Asde0svNXgGN7YW3PnI99kk8ZFJEWxW0wvNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cWKLZfWj1hlpLM1hykX+bRooXHS3IlAzbXNlo0jvE4pFbGGClJojTbTNZVMicKJsoworsoe2IpALkb/vIMQs498pn7IDyzUNByne2ylbEfdMrKnzgAIvng/53QadKbVMKqe9nWTnY3TytrIxzmAIXfbzgMii5ZZButuWe2Hfiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbIh3fIG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbIh3fIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60C01F000FF;
	Sat, 26 Sep 2026 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790411375;
	bh=mrzfiORims2XthH1OFC3dJ8sb3sdB8q1+pzh7d8iGEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fbIh3fIGcFSS9s46svhW4i9P4uy6VpIaHqemXTK7bTwb0/SK6wxYpCkOyY7vaskgr
	 XJA2ha+/vt9txdluG7evfOsB+I4AnI0GQTrX2uRPBQVOmHv7ctLsT8oQv+d0yxwHXU
	 VAJUxOhk2Et/3y656MVTUPetT89N8JnviJXROBBN9vUfRYAC+BgYwwxAfjwtELyP7/
	 6IrOooNqxjuS8HSpXIH7PZ8uB6+iZVKARK1oV21zob3Vf/pcBGsPuoxQHaRiZkbHa/
	 tPN1Y1tcrM1Cv7wZqOxolRFU0KBMJUYfiynsidD5q2CZDof3C+SbJdHvHTyO6UAzmD
	 61u3KMj2tHdhg==
From: Danilo Krummrich <dakr@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	dawid.osuchowski@linux.intel.com
Subject: Re: [PATCH] driver core: platform: Simplify platform_device_alloc()
Date: Sat, 26 Sep 2026 10:29:30 +0200
Message-ID: <20260926082930.419914-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925093928.3765486-1-cezary.rojewski@intel.com>
References: <20260925093928.3765486-1-cezary.rojewski@intel.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 25 Sep 2026 11:39:28 +0200, Cezary Rojewski wrote:
> [PATCH] driver core: platform: Simplify platform_device_alloc()

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: platform: Simplify platform_device_alloc()
      commit: b728c07e309f

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
