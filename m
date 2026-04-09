Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BCD39525E;
	Thu,  9 Apr 2026 22:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775774142; cv=none; b=tJlWurEnVAPMiWow+7MdkD3v3MOi1/VPfvTGe245nm5OSyRRT2J5QmW5ad9lxVLzPTpUqXeRkA/2nu/E/3Q955xYImLVi1hH7Kj3HFD7QHfpXcE0RbnAUVjXxoZ6FHBr5xkrViNhSpvbmdLVqUN+7613dV3Cehzs8WeWVN7J7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775774142; c=relaxed/simple;
	bh=BcGhsGc7uy9pRAEAm7Yz/VXxLn8umoOKNjRKAKNVQJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cpMJwGr/NdqGy4BawILUS8YfNt29MoHmVl4zX3d0r0RysYxAiQtEFJkJ04RQzlJidiKbzkQHLIeE1HZSyRNVxqG64fmWtBUSmdaQ5OHN5FApAAT3wf9n9Abu49iTsD4fVFPXic1XhWx8GaxrbCj+3mFWFrdZG/P9LesjWbXM+mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQHfIcNW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQHfIcNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBACC4CEF7;
	Thu,  9 Apr 2026 22:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775774142;
	bh=BcGhsGc7uy9pRAEAm7Yz/VXxLn8umoOKNjRKAKNVQJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uQHfIcNWLjH4N6xUXzQQqEKaUf0pYT7WO/mM0mwZfMMANh2ThWoA4NgAZCiA6uWYm
	 os+Glx78HzHQhJom2Av6bR1DfDpj/cFQupN208/j8SVRnuSm28q6KPr2AKLuwDa64m
	 6ZmqQriFNRhgXM/1kVoWakwgSIWpAyhtQoHXr4iBDW5boJ2Z946eT+oFlbC/TjI9CI
	 s1JOMAxfE3KzPRu5N7D2rh0hmMHEfE6xQQpUWreAJnz1QT7uCFCD6eB8yh7p/uxF/k
	 h9tO5vkCcDZoCAbsCtsXez/i6PA2nM56Baapx3ELsn6WBPMaHqwfmF5H1giqxI4r7S
	 QEW2/CsmGBuyQ==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Zxyan Zhu <zxyan0222@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev
In-Reply-To: <20260409035015.950764-1-zxyan0222@gmail.com>
References: <20260409035015.950764-1-zxyan0222@gmail.com>
Subject: Re: [PATCH v2] regmap: debugfs: fix race condition in dummy name
 allocation
Message-Id: <177576427939.997653.4795715036350830174.b4-ty@b4>
Date: Thu, 09 Apr 2026 20:51:19 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BcGhsGc7uy9pRAEAm7Yz/VXxLn8umoOKNjRKAKNVQJc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2Cm7islrsf4n7iZtzqzgvQhVIR+kfXarWGbCJ
 8qvwCX9rtyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadgpuwAKCRAk1otyXVSH
 0IBXB/0dXY/w8HjCeX0syklpALfNqrYnOMeP6pqBRu2J6ZORGW1apKb++WfRb8ksZgTwadh/6wO
 5HDfn9LC4H4aCOqI5vNJel5r5UFGIGZ8OD5W++ybP1uu4AbYSuvu4mvghKUVYWAeORR67g8F7DF
 /ZrcwxV94Gkb+wRh9ctd8FaTHwYFzoGgQ3DvyJaah1u7nrrvX0JDa7MK7tnSMd81yg8aWe0qxeK
 1bY+G6rM6q/5P8ZdPKU4HaGq3ho4JrjZX/GreCNVO1lYOqhraVNkVpdtGUEXyAmcBu3N1Su0F7z
 mTfkIqNjsiuobOoTtXvFE4a2Z8TvfD89W8xus024ST022iOy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 09 Apr 2026 11:50:15 +0800, Zxyan Zhu wrote:
> regmap: debugfs: fix race condition in dummy name allocation

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.1

Thanks!

[1/1] regmap: debugfs: fix race condition in dummy name allocation
      https://git.kernel.org/broonie/regmap/c/7d696210cf36

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

