Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46346242D62;
	Mon,  4 May 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777926739; cv=none; b=X4cmjjijmZJWOPOkYsadX3L9GzUAUSM1+aoKLncTZE7q5nNFj9wfMkfQGdXJCAM4yYj9OrRr8ol7D7sxBAPC0LQr1qu2idX+XVg3Eqj5K3Zc2pHobGC5LUL1mbxQhE7NDcN8P2LSsp7k4sRGic6pfpVgfwEDCWTw4atHVDyuqn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777926739; c=relaxed/simple;
	bh=/GVJqVFuesfZn9Mxo4+RmayRL55xTqCglbmYa3VN3Go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C4Oc7kNpQAuR+hLrGbDBVWxx8s39oINWtGweAcCYcp9VDQ+GAtdxoKV3gXtPzR1UEUcmFiHBuokt8mNyhmTCRs4R3iinb2Ymp+iFDPO7088+AIisuBaYfO1g4bhHTpaLN4iljIOnfkFTgn37HoEZTPGTgrYCK2fXbh6oadUDHZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXAf/vbj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXAf/vbj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2A4C2BCB8;
	Mon,  4 May 2026 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777926738;
	bh=/GVJqVFuesfZn9Mxo4+RmayRL55xTqCglbmYa3VN3Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QXAf/vbjfOUYYRZ5o1+HQVz2v5bio8yi375w2DZneCrvqfxW57Lii9NyYb9ReIt+m
	 /COVsSf42in+wOo9SJMZlxJbirooY4tWfh36s9wgUhmPHKaLyIGD78WFHGMYYOPSLX
	 ISQuylLKyKd5coqfollJ4WsUN1dMJPEjtrw16CE4DjUeUTXKYaXXyX/J4EPfUvhf6A
	 55BtoFYZF1xBrvYi+qByziVnnAR1jAJa262hB67BfvoSekOHqGZVogWkYHYlxclL+0
	 pzHtwRrbYpXpNGROidCJ/91XWE14hF0ChDqtRMM0QoEtC3JdTCKxilojgQleZHfI5H
	 gt2gdcRc+N6wA==
From: Danilo Krummrich <dakr@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isa: switch to dynamic root device
Date: Mon,  4 May 2026 22:32:13 +0200
Message-ID: <20260504203213.2876024-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424102400.2615677-1-johan@kernel.org>
References: <20260424102400.2615677-1-johan@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 24 Apr 2026 12:24:00 +0200, Johan Hovold wrote:
> [PATCH] isa: switch to dynamic root device

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] isa: switch to dynamic root device
      commit: 30c878ed1699

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
