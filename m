Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012861;
	b=isDp1blnkdmZg+g79nwFwsfziruiQoq3rcNiMYnR02xaBfYRJjCf2AJqMcaqIMIqJYhh
	 mWoL7Fllx1hS1lzATMgfSECCQGkFtfK+voig0G2dhq5Zs2OVINNAlSNXAT93uMz8OU475
	 RU7H0lMLnfS2I5Gv57Kc9wOpR8SjbAM9kiEAmNjVReltRo12g3a6YWMxtYGZFAkAQqda6
	 RtisbF8xxKk/EfAxjx3i68O1pwSv26QbCx5QW2fAWqaa53s50ThdhZ9EN9xnLSNtZd3L6
	 F6lSnNTuvkygrpeND62PhHjutqzSlDbl7bRTwuvOJ+v/RR1NIIuymmKRrQg1vnqP/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012861;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7+mRpJeKBHHoa28rEWZMm/sPlV6gYEEAky7VyrWHpbY=;
	b=WLS6gsh+YD+ZFsBtjpw9v+3ViGmC29N450MuT/MX7R9f3EnbaxgLGdbDzP2KgUFhELp/
	 EwOk/S5B2tblVFRj0PN6M5Ok0IdSkHnKS6Vq0yY27VyD4otEKlm0HBbIdnCi2mTeHhcsg
	 gawqz1rFavFIGcXhyjzduPQjCmxBIVTO3hsb46MG7FDR9maRCx7LFmbi0lJOwR+glU/if
	 qcn/2i1Y2ltzeY6Oc7AnzRO60uZTw8Pu+hu1zR7WCGiuAZm1+GwT4uGaflu/h9L/jRq3W
	 gtGueVI7JZqQZ450cppXVe6MUVQVozpFpUZK0aP5M3R8GXiWCPPI2fQzRZjgdi6Nhrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a6Ne/9vc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE8606A31C;
	Wed, 18 Nov 2026 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a6Ne/9vc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38AF1F000C4;
	Wed, 18 Nov 2026 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012860;
	bh=7+mRpJeKBHHoa28rEWZMm/sPlV6gYEEAky7VyrWHpbY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a6Ne/9vcCzK2empC/5XBecm6xf9pUZ8dNIs2oU9lflj/4kn0AEo/Z1IjuXmZVKa/6
	 CqJcHwUWXCbPedTSfTWf6ByBcbU022EIu9WU2ZjzFcrHGXT1oNVoWDviGxNhdJ0Qlt
	 YqoFZz0EhIpbZul22k9hDOTR/MooONz8vOaRxrmXGu5r/6kY1u0sDtVP8BLLzju9iM
	 lmY41JvBrPwXLGQvGi6y4tKd2XtAbUa23u0g/cB0FoMUqzD72ZJC9DN4QqHnoWrMsZ
	 fJz1I148N3Adg5h1HFy8oLUpFTDzQKguDtnmNBBMqTU7E/SM5loSIF9PY8GREjZWym
	 w/ymERN5MczZQ==
From: Mark Brown <broonie@kernel.org>
To: Peng Fan <peng.fan@linux.dev>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 peng.fan@nxp.com, Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261117161815.1576684-1-peng.fan@linux.dev>
References: <20261117161815.1576684-1-peng.fan@linux.dev>
Subject: Re: [PATCH] regmap: fix reinit cache failure handling
Message-Id: <179500874806.124542.6390398684578929671.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:32:28 +0000
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2AXiI/3Dg8JdELmM11/Ha8wt8QsbRLrFBhO+M/gkHoc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+7vgVuCTjYbxwKEPctJW7raccDJu9+fize8HXdgcu2
 eAnvZHBtaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT0eVg+Cs1oXjbQVOjSWt6
 m98XtbAneVr93u76+4Xwgs9lJS+/5T5nZNixvVjGe9Jh/R+F7nlS316ZnPext11smRlisvlKT9M
 FCVYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 00:18:15 +0800, Peng Fan wrote:
> regmap: fix reinit cache failure handling

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/1] regmap: fix reinit cache failure handling
      https://git.kernel.org/broonie/regmap/c/0a94ff3d3cc9

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

