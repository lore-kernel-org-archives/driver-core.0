Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3473ED3BF;
	Fri, 29 May 2026 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065750; cv=none; b=b/ek0AgrDxICXOHcdhogyTzxweF7HUV0whS47Fxqid3A6bzx5WZe6OzUX8Oe127FXIcMqcsSS+aMFYqCb0hh0UfOzoeZvzpXQeVSJrSlJ56nOrxxou9jNlP79r+AylWEcevbBSTN/9AZJDMBJnN9HyTkzGwdqW1fhFIdEHIIxwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065750; c=relaxed/simple;
	bh=5HCAyPI2WCL0E6LnXOxpJZqiE4sHLCdQqD+Hl3ovWPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h3yCkXALv5UeZmab3zK5hC/YoYs9v+NrmABnSYh2kgizkagjFXYNMlMa7krq7mi6y8uVz/CjYxnsc7tXvm5UQrhRUBC8GEYhanIPLSGxtQ1mxnghBv7DqTRNa9F7lB6avxsSKAJM7CMJ9QnnUfmYGtcJeuN3BB9+MjCqn4ykLLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpJM0t3E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpJM0t3E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66641F00893;
	Fri, 29 May 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065748;
	bh=wDF5Dt7nHxSPcBsfybxty4MyfN/hxQald2hXVcS3yHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RpJM0t3EAvrDDQxwXCJbDsnbWa3O+ffJ8RyDxOv0ZoCplb2i9Ji7S6O3+/0Cb48tg
	 HPlX2V4USFW7hR/5VXRzVk8VYmTbROPQb/wbO8kSvtHcRDJNBFW0oEbpI8SfA77WDa
	 u8PW9FGrY4JSnRlm5aL2k6ccsaVarv6GhN9L7gMRFXd18BUzRL0VLp3EXdTyQri8y3
	 qXg8LmtiDTqr/frVCJCAi/UEpFQmLIUpgCgIIZ+MB/LsNnQQFDnIz8zT1x43k8xkPV
	 tYbeR2Zml3Ftfh3LSTHiJsq1daUSJRr7j6MXOiOi00lTmnJZWpr2QAS5dB3njBaFse
	 YPJAxhZuTML+Q==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, phucduc.bui@gmail.com
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260528053204.46783-1-phucduc.bui@gmail.com>
References: <20260528053204.46783-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] regmap: reject volatile update_bits() in cache-only
 mode
Message-Id: <177997780971.8579.10018213319147837982.b4-ty@b4>
Date: Thu, 28 May 2026 15:16:49 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5HCAyPI2WCL0E6LnXOxpJZqiE4sHLCdQqD+Hl3ovWPc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqGaXSSbpTalv+P1xeljHV9h3YdLj2NADaTNCBD
 v7vxZdbe3mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahml0gAKCRAk1otyXVSH
 0D2vB/43Cv8inUAGUO5N59+8ygVIi4JwpPXYPFDZZZd2ixkcQqtS+x7u/vYyVd9hGCHSXrhphaZ
 TgZcgRbUsF+FV0B4ibFXqwhCgNWWMiVWf4lVGK0dIIMsNPKrHlFCRxmVmKYMwBdLX5x5D1E9jz2
 sIOiyHBN+/cdccI0VCI2wpKTyxpYf67F78CAj457HKET7ju9IMPdEuxddaxNDFiCxHNlYH8BO2u
 fP+4+2V4A/AAlakK+moRAxeW5ow5CNqDVBsWauis21PgjPko6nF1XwG3AAK0JRVHGV6qwAByel5
 Nz1JFAP7J4Vs7bzY67cGda4k4wxbNu65YHBq5uUExDNUbRMc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 28 May 2026 12:32:04 +0700, phucduc.bui@gmail.com wrote:
> regmap: reject volatile update_bits() in cache-only mode

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.1

Thanks!

[1/1] regmap: reject volatile update_bits() in cache-only mode
      https://git.kernel.org/broonie/regmap/c/006c66d1d52f

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

